
return {
    "Fildo7525/pretty_hover",
	event = "LspAttach",
    opts = {
        group = {
            detect = {
                -- ["Group name"] = {"detectors"}
                ["Parameters"] = { "[\\@]param", "[\\@]*param*" },
                ["Types"] = { "[\\@]tparam" },
                ["See"] = { "[\\@]see" },
                ["Return Value"] = { "[\\@]return+s?" },
                ["Author"] = { "[\\@]author" },
                ["Authors"] = { "[\\@]authors" },
                ["Date"] = { "[\\@]date" }
            },
            styler = "`"
        }
    }
}
