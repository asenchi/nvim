local timer = vim.loop.new_timer()
local blink = function()
    local cnt, blink_times = 0, 8
    timer:start(0, 100, vim.schedule_wrap(function()
        vim.cmd('set cursorcolumn! cursorline!')
        cnt = cnt + 1
        if cnt == blink_times then timer:stop() end
    end))
end

vim.keymap.set('n', '<leader>cb', blink)
