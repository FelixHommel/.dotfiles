---------------------
---- KEYBINDINGS ----
---------------------

local binds = require("config")

-- Window actions
hl.bind(binds.mainMod .. " + C", hl.dsp.window.close())
hl.bind(binds.mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(binds.mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(binds.mainMod .. " + O", hl.dsp.layout("togglesplit")) -- dwindle only

-- Programs and Tools
hl.bind(binds.mainMod .. " + T", hl.dsp.exec_cmd(binds.terminal))
hl.bind(binds.mainMod .. " + R", hl.dsp.exec_cmd(binds.launcher))
hl.bind("CTRL + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind(binds.mainMod .. " + X", hl.dsp.exec_cmd("hyprlock --grace 5 --quiet"))
hl.bind(binds.mainMod .. " + Z", hl.dsp.exec_cmd("systemctl hibernate"))

-- Utility
hl.bind(binds.mainMod .. " + SPACE", hl.dsp.exec_cmd("hyprctl switchxkblayout all next"))

-- Move focus with binds.mainMod + hjkl
hl.bind(binds.mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(binds.mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(binds.mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(binds.mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

-- Switch workspaces with binds.mainMod + [0-9]
-- Move active window to a workspace with binds.mainMod + SHIFT + [0-9]
for i = 0, 9 do
	hl.bind(binds.mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
	hl.bind(binds.mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(binds.mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(binds.mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with binds.mainMod + scroll
hl.bind(binds.mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(binds.mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with binds.mainMod + LMB/RMB and dragging
hl.bind(binds.mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(binds.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
