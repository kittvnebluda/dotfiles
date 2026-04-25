vim.keymap.set("n", "<Plug>(FlappyBird)", function()
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_set_option_value("buftype", "nofile", { buf = buf })
    vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf })
    vim.api.nvim_command("buffer " .. buf)

    local gravity = -9.81
    local state = { pos = 0, vel = 0 }

    local function update_physics(dt)
        state.vel = state.vel + gravity * dt
        state.pos = state.pos + state.vel * dt
    end

    local function draw_frame(frame_data)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, frame_data)
    end
    local function render()
        local width = vim.api.nvim_win_get_width(0)
        local height = vim.api.nvim_win_get_height(0)
        draw_frame({ "#", "# @ #", "#####" })
    end

    local timer = vim.loop.new_timer()
    local dt = 0.01
    timer:start(
        0,
        dt * 1000,
        vim.schedule_wrap(function()
            update_physics(dt)
            render()
            print(state.pos)
        end)
    )
end)

vim.keymap.set("n", "<leader>]", "<Plug>(FlappyBird)")
