hl.config({
	input = {
		kb_layout = "us,ru",
		kb_variant = "",
		kb_model = "",
		kb_options = "grp:alt_shift_toggle",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = true,
			clickfinger_behavior = true,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})
hl.gesture({
	fingers = 3,
	direction = "up",
	action = "fullscreen",
})
hl.gesture({
	fingers = 3,
	direction = "down",
	action = "float",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})
