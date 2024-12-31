-- TODO: lua/config/treesitter 로 이사가기

---@param desc string
---@return vim.keymap.set.Opts
local function o(desc)
  return {
    noremap = true,
    nowait = true,
    desc = 'hoo: treesitter: ' .. desc,
  }
end

---주어진 임의의 기준 노드부터 상위로 가면서
---범위가 동일한 노드 중 가장 상위 노드를 찾아 반환합니다.
---기준 노드 자기 자신 포함
---@param node? TSNode 기준 노드
---@return TSNode? node 범위가 동일한 가장 상위 노드
local function flatten_by_range(node)
  if not node then
    return
  end

  local ok, csr, csc, cer, cec = pcall(node.range or function()
    error()
  end, node)
  if not (ok and csr and csc and cer and cec) then
    return
  end

  local parent = node:parent()
  if not parent then
    return node
  end

  local psr, psc, per, pec = parent:range()
  if csr == psr and csc == psc and cer == per and cec == pec then
    return flatten_by_range(parent)
  else
    return node
  end
end

---주어진 노드의 범위의 시작으로 커서를 이동시킵니다.
---@param node TSNode
local function goto_start(node)
  local sr, sc = node:range()

  local maxr = vim.api.nvim_buf_line_count(0) - 1

  vim.api.nvim_win_set_cursor(0, { math.min(maxr, sr) + 1, sc })
end

---주어진 노드의 범위의 끝으로 커서를 이동시킵니다.
---@param node TSNode
local function goto_end(node)
  local _, _, er, ec = node:range()

  local maxr = vim.api.nvim_buf_line_count(0) - 1
  if er > maxr then
    er = maxr
    ec = vim.api.nvim_buf_get_lines(0, er, er + 1, false)[1]:len()
  end

  vim.api.nvim_win_set_cursor(0, { er + 1, math.max(0, ec - 1) })
end

---@return TSNode? node 현재 커서 상의 노드 범위와 동일한 범위의 가장 상위 노드
local function inner()
  return flatten_by_range(vim.treesitter.get_node())
end

---1. _node_: 현재 커서 상의 노드 범위보다 큰 범위를 갖는 가장 하위 노드
---2. _fallback_: _node_ 가 없을 때 쓰일 노드
---@return TSNode? node, TSNode? fallback
local function outer()
  local i = inner()
  if i then return i:parent(), i end
end

---@param supply fun(): TSNode?, TSNode? 노드를 반환하는 함수
---@param consume fun(TSNode) 주어진 노드를 기준으로 커서를 이동시키는 함수
---@return fun() rhs 모든 _supply_ 컨디션에 대하여 묵묵히 _consume_ 하는 함수
local function compose(supply, consume)
  return function()
    local node, fallback = supply()
    node = node or fallback
    if node then consume(node) end
  end
end

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        auto_install = true,
        highlight = {
          enable = true,
          disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100KB
            ---@diagnostic disable-next-line: undefined-field
            local ok, stats = pcall(vim.loop.fs_stat,
              vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
      }

      vim.keymap.set(
        { 'n', 'v' }, '[',
        compose(inner, goto_start),
        o 'Go to Start of Current Node')

      vim.keymap.set(
        { 'n', 'v' }, ']',
        compose(inner, goto_end),
        o 'Go to End of Current Node')

      vim.keymap.set(
        { 'n', 'v' }, '{',
        compose(outer, goto_start),
        o 'Go to Start of Current Node')

      vim.keymap.set(
        { 'n', 'v' }, '}',
        compose(outer, goto_end),
        o 'Go to End of Current Node')
    end,
  },
}
