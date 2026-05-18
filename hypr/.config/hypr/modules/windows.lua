-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})
hl.window_rule({
	name = "picture-in-picture",
	match = { title = "^(Picture-in-Picture)$" },
	pin = true,
	float = true,
	no_initial_focus = true,
	size = "400 225",
	move = "1020 650",
})

hl.window_rule({
	name = "clipse",
	match = { title = "^(clipse)$" },
	float = true,
	size = "622 652",
	center = true,
})

hl.window_rule({
	name = "zen-browser-float",
	match = { class = "^(app.zen_browser.zen)$" },
	float = true,
})

hl.window_rule({
	name = "xephyr-xwayland-float",
	match = { class = "^(Xephyr|Xwayland)$" },
	float = true,
	fullscreen = true,
})

hl.window_rule({
	name = "pygame-float",
	match = { title = "^(pygame window)$" },
	float = true,
})

hl.window_rule({
	name = "matplotlib-float",
	match = { class = "^(Matplotlib)$" },
	float = true,
})

hl.window_rule({
	name = "joint-state-publisher-float",
	match = { class = "^(joint_state_publisher_gui)$" },
	float = true,
})
