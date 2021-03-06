return {
  setup = function()
    vim.notify = function(...)
      require "notify"(...)
    end
  end,
  config = function()
    -- local send_key = require("config.utils").send_key
    local send_key = function(key)
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "")
    end
    nnoremap("<CR>", function()
      local bufs = vim.api.nvim_list_bufs()
      local notif_win = nil
      for _, buf in pairs(bufs) do
        local win = vim.fn.bufwinid(buf)
        if win ~= -1 and vim.api.nvim_buf_get_option(buf, "filetype") == "notify" then
          notif_win = win
          break
        end
      end
      if not notif_win then
        send_key "j"
      else
        pcall(vim.api.nvim_win_close, notif_win, true)
      end
    end)
  end,
}
