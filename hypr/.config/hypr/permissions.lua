-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/

hl.config({
	ecosystem = {
		enforce_permissions = true,
	},
})

-- For Discord screensharing
hl.permission({ binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", type = "screencopy", mode = "allow" })

-- For Screenshots
hl.permission({ binary = "/usr/bin/grim", type = "screencopy", mode = "allow" })
