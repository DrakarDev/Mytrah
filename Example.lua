local Mytrah = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/DrakarDev/Mytrah/master/Mytrah.lua"
))()
local API = "https://mythraverifid-production.up.railway.app"
local Auth = loadstring(game:HttpGet(API .. "/client/mythra-verifid.lua"))()
local DEMO_THEME = Mytrah.Themes and Mytrah.Themes.Cartoon and "Cartoon" or "Obsidian"
if DEMO_THEME ~= "Cartoon" then
    warn("[Mytrah] Loaded an older library build; using Obsidian until the cache refreshes.")
end

Mytrah:RegisterIcon("demo", Mytrah.Icons.diamond)

local Window
local Watermark
local statusParagraph

local function notify(title, content, notificationType)
    Window:Notify({
        Title = title,
        Content = content,
        Type = notificationType or "Info",
        Duration = 4,
    })
end

local function openLibraryInfo()
    Window:Dialog({
        Title = "Library information",
        Subtitle = "Complete API example",
        Icon = "user",
        Width = 430,
        Tabs = {
            {
                Title = "Library",
                Icon = "info",
                Details = {
                    { Label = "Version", Value = "Mytrah v" .. Mytrah.Version, Color = "Accent" },
                    { Label = "Config path", Value = Window:GetConfigPath() },
                    { Label = "Visible", Value = tostring(Window:IsVisible()), Color = "Success" },
                },
            },
            {
                Title = "Appearance",
                Icon = "palette",
                Details = {
                    { Label = "Theme", Value = Window.ThemeName },
                    { Label = "Font", Value = Window:GetFont() },
                    { Label = "Text scale", Value = string.format("%.2f", Window:GetTextScale()) },
                },
            },
        },
        CloseOnBackdrop = true,
        Buttons = {
            { Title = "Close", Primary = true },
        },
    })
end

local function openRuntimeInfo()
    Window:Dialog({
        Title = "Runtime information",
        Subtitle = "Current window state",
        Icon = "cog",
        Width = 390,
        Details = {
            { Label = "Theme", Value = Window.ThemeName, Color = "Accent" },
            { Label = "Auto text scale", Value = tostring(Window.AutoTextScale) },
            { Label = "Window width", Value = tostring(Window._windowSize.X) },
            { Label = "Window height", Value = tostring(Window._windowSize.Y) },
        },
        Buttons = {
            {
                Title = "Reset theme",
                Width = 100,
                Callback = function()
                    Window:SetTheme("Obsidian")
                end,
            },
            { Title = "Close", Width = 76, Primary = true },
        },
    })
end

local function buildAuthenticated(user, session)
Window = session:CreateWindow({
    Title = "Mytrah",
    Subtitle = "Complete API Demo",
    Icon = "demo",
    Theme = DEMO_THEME,
    Size = UDim2.fromOffset(720, 460),
    MinSize = Vector2.new(700, 420),
    MaxSize = Vector2.new(1000, 700),
    MinimizeKey = Enum.KeyCode.RightControl,
    ToggleKey = Enum.KeyCode.RightControl,
    AutoSave = true,
    AutoLoad = true,
    AutoTextScale = true,
    Font = "Cartoon",
})

local DemoCategory = Window:AddCategory("Demo")
local ControlsTab = DemoCategory:AddTab({
    Title = "Controls",
    Description = "Every interactive control",
    Icon = "sliders",
})
local FeedbackTab = DemoCategory:AddTab({
    Title = "Feedback",
    Description = "Dialogs, notifications and dynamic content",
    Icon = "message",
})

local InterfaceCategory = Window:AddCategory("Interface")
local AppearanceTab = InterfaceCategory:AddTab({
    Title = "Appearance",
    Description = "Themes, sizing and visibility",
    Icon = "palette",
})
local ConfigTab = InterfaceCategory:AddTab({
    Title = "Configuration",
    Description = "Persistence and JSON import/export",
    Icon = "save",
})

local RuntimeTab = Window:AddTab({
    Category = "Advanced",
    Title = "Runtime API",
    Description = "Programmatic methods and lifecycle",
    Icon = "terminal",
})
local DirectTab = Window:AddTab({
    Category = "Advanced",
    Title = "Direct API",
    Description = "Sections without subtabs",
    Icon = "code",
})
local DirectSection = DirectTab:AddSection({ Title = "Tab:AddSection", Icon = "code", Side = "Left" })
DirectSection:AddLabel({
    Title = "Direct section",
    Icon = "info",
    Content = "This demonstrates Window:AddTab and Tab:AddSection without a subtab.",
})

local BasicSubTab = ControlsTab:AddSubTab({ Title = "Basic", Icon = "sliders" })
local SelectionSubTab = ControlsTab:AddSubTab({ Title = "Selection", Icon = "list" })
local TextSubTab = ControlsTab:AddSubTab({ Title = "Text", Icon = "edit" })
local DialogSubTab = FeedbackTab:AddSubTab({ Title = "Dialogs", Icon = "message" })
local NoticeSubTab = FeedbackTab:AddSubTab({ Title = "Notifications", Icon = "bell" })
local ThemeSubTab = AppearanceTab:AddSubTab({ Title = "Themes", Icon = "palette" })
local WindowSubTab = AppearanceTab:AddSubTab({ Title = "Window", Icon = "maximize" })
local StorageSubTab = ConfigTab:AddSubTab({ Title = "Storage", Icon = "database" })
local JsonSubTab = ConfigTab:AddSubTab({ Title = "JSON", Icon = "code" })
local MethodsSubTab = RuntimeTab:AddSubTab({ Title = "Methods", Icon = "terminal" })
local LifecycleSubTab = RuntimeTab:AddSubTab({ Title = "Lifecycle", Icon = "power" })

local BasicLeft = BasicSubTab:AddSection({ Title = "State", Icon = "activity", Side = "Left" })
local BasicRight = BasicSubTab:AddSection({ Title = "Actions", Icon = "rocket", Side = "Right" })

local enabledToggle = BasicLeft:AddToggle({
    Title = "Enable demo",
    Description = "Toggle with flag and callback",
    Icon = "power",
    Flag = "DemoEnabled",
    Default = true,
    Callback = function(value)
        if statusParagraph then
            statusParagraph:SetContent(value and "The complete demo is enabled." or "The complete demo is paused.")
        end
        notify("Demo state", value and "Enabled" or "Disabled", value and "Success" or "Warning")
    end,
})

local speedSlider = BasicLeft:AddSlider({
    Title = "Speed",
    Description = "Slider with step and suffix",
    Icon = "sliders",
    Flag = "DemoSpeed",
    Min = 0,
    Max = 100,
    Step = 1,
    Suffix = "%",
    Default = 35,
})

local precisionSlider = BasicLeft:AddSlider({
    Title = "Precision",
    Icon = "target",
    Flag = "DemoPrecision",
    Min = 0,
    Max = 1,
    Step = 0.05,
    Default = 0.5,
})

local runButton = BasicRight:AddButton({
    Title = "Run demo action",
    Description = "Button:Fire is also demonstrated",
    Icon = "play",
    Callback = function()
        notify("Action complete", "The demo button fired.", "Success")
    end,
})

BasicRight:AddButton({
    Title = "Fire button from code",
    Icon = "rocket",
    Callback = function()
        runButton:Fire()
    end,
})

local quickKeybind = BasicRight:AddKeybind({
    Title = "Quick action",
    Description = "Press the selected key",
    Icon = "key",
    Flag = "DemoKeybind",
    Default = Enum.KeyCode.K,
    Callback = function(key)
        notify("Keybind", "Pressed " .. key.Name, "Info")
    end,
})

BasicRight:AddDivider("Live status")
statusParagraph = BasicRight:AddParagraph({
    Title = "Status",
    Icon = "info",
    Flag = "StatusParagraph",
    Content = "The complete demo is enabled.",
})

local SelectionLeft = SelectionSubTab:AddSection({ Title = "Dropdowns", Icon = "list", Side = "Left" })
local SelectionRight = SelectionSubTab:AddSection({ Title = "Color", Icon = "palette", Side = "Right" })

local modeDropdown = SelectionLeft:AddDropdown({
    Title = "Execution mode",
    Icon = "layers",
    Flag = "DemoMode",
    Values = { "Balanced", "Fast", "Precise" },
    Default = "Balanced",
})

local modulesDropdown = SelectionLeft:AddDropdown({
    Title = "Active modules",
    Description = "Multi-select and searchable",
    Icon = "package",
    Flag = "DemoModules",
    Values = { "Monitor", "Alerts", "History", "Overlay", "Automation", "Inventory", "Network" },
    Default = { "Monitor", "Alerts" },
    Multi = true,
    Searchable = true,
})

SelectionLeft:AddButton({
    Title = "Replace dropdown values",
    Icon = "refresh",
    Callback = function()
        modeDropdown:SetValues({ "Safe", "Balanced", "Aggressive", "Custom" }, true)
        modeDropdown:SetValue("Safe")
    end,
})

local markerColor = SelectionRight:AddColorPicker({
    Title = "Marker color",
    Icon = "palette",
    Flag = "DemoColor",
    Default = Color3.fromRGB(74, 222, 211),
    Callback = function(value)
        print("Selected color:", value)
    end,
})

SelectionRight:AddLabel({
    Title = "Selection API",
    Icon = "info",
    Content = "Dropdowns support single, multi, search, SetValue and SetValues. ColorPicker values persist as hex.",
})

local TextLeft = TextSubTab:AddSection({ Title = "Inputs", Icon = "edit", Side = "Left" })
local TextRight = TextSubTab:AddSection({ Title = "Presentation", Icon = "file", Side = "Right" })

local nameInput = TextLeft:AddInput({
    Title = "Display name",
    Description = "Text input with OnEnter",
    Icon = "user",
    Flag = "DemoName",
    Placeholder = "Enter a name",
    Default = "Player",
    OnEnter = function(value)
        notify("Input submitted", value, "Info")
    end,
})

local numericInput = TextLeft:AddInput({
    Title = "Target value",
    Icon = "target",
    Flag = "DemoTarget",
    Numeric = true,
    Min = 0,
    Max = 1000,
    Default = 100,
})

local dividerHandle = TextRight:AddDivider("Paragraph and label")
local dynamicParagraph = TextRight:AddParagraph({
    Title = "Dynamic paragraph",
    Icon = "message",
    Content = "Use the button below to update this content at runtime.",
})
TextRight:AddButton({
    Title = "Update paragraph",
    Icon = "edit",
    Callback = function()
        dynamicParagraph:SetContent("Updated at " .. os.date("%H:%M:%S") .. ". Paragraph height adjusts automatically.")
    end,
})
TextRight:AddButton({
    Title = "Toggle divider visibility",
    Icon = "eye",
    Callback = function()
        dividerHandle:SetVisible(not dividerHandle.Instance.Visible)
    end,
})

local DialogLeft = DialogSubTab:AddSection({ Title = "Dialog types", Icon = "message", Side = "Left" })
local DialogRight = DialogSubTab:AddSection({ Title = "Secure form", Icon = "lock", Side = "Right" })

DialogLeft:AddButton({
    Title = "Details dialog",
    Icon = "user",
    Callback = function()
        Window:Dialog({
            Title = "Structured details",
            Subtitle = "Dialog.Details API",
            Icon = "database",
            Details = {
                { Label = "Status", Value = "Active", Color = "Success" },
                { Label = "Mode", Value = tostring(modeDropdown:GetValue()), Color = "Accent" },
                { Label = "Speed", Value = tostring(speedSlider:GetValue()) .. "%" },
                { Label = "User", Value = tostring(nameInput:GetValue()) },
            },
            Buttons = { { Title = "Close", Primary = true } },
        })
    end,
})

DialogLeft:AddButton({
    Title = "Confirmation dialog",
    Icon = "alert-circle",
    Callback = function()
        Window:Dialog({
            Title = "Run destructive action?",
            Subtitle = "Confirmation example",
            Content = "Buttons can be primary, secondary, custom width, keep the dialog open, or close automatically.",
            Type = "Warning",
            Icon = "alert-circle",
            CloseOnBackdrop = true,
            Buttons = {
                { Title = "Cancel", Primary = false },
                {
                    Title = "Confirm",
                    Primary = true,
                    Callback = function()
                        notify("Confirmed", "The confirmation callback ran.", "Success")
                    end,
                },
            },
        })
    end,
})

DialogRight:AddButton({
    Title = "Secure input dialog",
    Icon = "lock",
    Callback = function()
        Window:Dialog({
            Title = "Secure fields",
            Subtitle = "Inputs and handle:GetValue",
            Icon = "lock",
            Inputs = {
                { Name = "Username", Placeholder = "Username" },
                { Name = "Password", Placeholder = "Password", Secure = true },
            },
            Buttons = {
                { Title = "Cancel", Primary = false },
                {
                    Title = "Submit",
                    Primary = true,
                    Close = false,
                    Callback = function(dialog)
                        local values = dialog:GetValues()
                        local username = dialog:GetValue("Username")
                        local password = values.Password or ""
                        notify("Secure form", username .. " / password length " .. tostring(#password), "Success")
                        dialog:Close()
                    end,
                },
            },
        })
    end,
})

local NoticeLeft = NoticeSubTab:AddSection({ Title = "Notification types", Icon = "bell", Side = "Left" })
local NoticeRight = NoticeSubTab:AddSection({ Title = "Global wrapper", Icon = "globe", Side = "Right" })
local closableNotification

for _, item in ipairs({
    { "Info notification", "Info", "info" },
    { "Success notification", "Success", "check-circle" },
    { "Warning notification", "Warning", "alert-circle" },
    { "Error notification", "Error", "x" },
}) do
    NoticeLeft:AddButton({
        Title = item[1],
        Icon = item[3],
        Callback = function()
            notify(item[2], "This is a " .. string.lower(item[2]) .. " toast.", item[2])
        end,
    })
end

NoticeRight:AddButton({
    Title = "Mytrah:Notify",
    Icon = "globe",
    Callback = function()
        Mytrah:Notify({ Title = "Global notification", Content = "Uses the active window.", Type = "Info" })
    end,
})
NoticeRight:AddButton({
    Title = "Create closable notification",
    Icon = "bell",
    Callback = function()
        closableNotification = Window:Notify({
            Title = "Notification handle",
            Content = "Close this toast with the next button.",
            Type = "Info",
            Duration = 30,
        })
    end,
})
NoticeRight:AddButton({
    Title = "Notification:Close",
    Icon = "x",
    Callback = function()
        if closableNotification then
            closableNotification:Close()
            closableNotification = nil
        end
    end,
})

local ThemeLeft = ThemeSubTab:AddSection({ Title = "Theme", Icon = "palette", Side = "Left" })
local ThemeRight = ThemeSubTab:AddSection({ Title = "Text", Icon = "edit", Side = "Right" })

ThemeLeft:AddDropdown({
    Title = "Theme preset",
    Icon = "moon",
    Flag = "DemoTheme",
    Values = { "Obsidian", "Marine", "Ember", "Paper", "Carbon", "Forest", "Crimson", "Frost", "Cartoon", "Candy", "Aurora" },
    Default = "Obsidian",
    Callback = function(theme)
        Mytrah:SetTheme(theme)
    end,
})

ThemeRight:AddToggle({
    Title = "Automatic text scale",
    Icon = "maximize",
    Flag = "DemoAutoTextScale",
    Default = true,
    Callback = function(value)
        Window:SetAutoTextScale(value)
    end,
})

ThemeRight:AddDropdown({
    Title = "Font family",
    Icon = "edit",
    Flag = "DemoFont",
    Values = { "Gotham", "Source Sans", "Roboto", "Ubuntu", "Roboto Mono", "Cartoon" },
    Default = "Gotham",
    Callback = function(font)
        Mytrah:SetFont(font)
    end,
})

ThemeRight:AddSlider({
    Title = "Manual text scale",
    Icon = "sliders",
    Min = 0.8,
    Max = 1.15,
    Step = 0.05,
    Default = 1,
    Callback = function(value)
        Window:SetTextScale(value)
    end,
})

local WindowLeft = WindowSubTab:AddSection({ Title = "Size", Icon = "maximize", Side = "Left" })
local WindowRight = WindowSubTab:AddSection({ Title = "Visibility", Icon = "eye", Side = "Right" })

WindowRight:AddKeybind({
    Title = "Show / hide key",
    Icon = "eye",
    Default = Enum.KeyCode.RightControl,
    Changed = function(key)
        Window:SetToggleKey(key)
    end,
})

for _, preset in ipairs({
    { "Compact", Vector2.new(700, 420) },
    { "Default", Vector2.new(720, 460) },
    { "Large", Vector2.new(900, 580) },
}) do
    WindowLeft:AddButton({
        Title = preset[1] .. " window",
        Icon = "maximize",
        Callback = function()
            Window:SetSize(preset[2], true)
        end,
    })
end

WindowRight:AddButton({ Title = "Minimize / restore", Icon = "minimize", Callback = function() Window:Minimize() end })
WindowRight:AddButton({
    Title = "Toggle for one second",
    Icon = "eye",
    Callback = function()
        Window:Toggle(false)
        task.delay(1, function()
            if not Window._destroyed then Window:Toggle(true) end
        end)
    end,
})
WindowRight:AddButton({
    Title = "Hide for one second",
    Icon = "eye",
    Callback = function()
        Window:SetVisible(false)
        task.delay(1, function()
            if not Window._destroyed then Window:SetVisible(true) end
        end)
    end,
})

local watermarkToggle = WindowRight:AddToggle({
    Title = "Show watermark",
    Icon = "bookmark",
    Default = true,
    Callback = function(value)
        if Watermark then Watermark:SetVisible(value) end
    end,
})

local StorageLeft = StorageSubTab:AddSection({ Title = "File storage", Icon = "database", Side = "Left" })
local StorageRight = StorageSubTab:AddSection({ Title = "Storage location", Icon = "folder", Side = "Right" })

StorageLeft:AddButton({
    Title = "Save configuration",
    Icon = "save",
    Callback = function()
        local ok, result = Window:SaveConfig()
        notify(ok and "Configuration saved" or "Save unavailable", tostring(result), ok and "Success" or "Error")
    end,
})
StorageLeft:AddButton({
    Title = "Save via Mytrah",
    Icon = "save",
    Callback = function()
        local ok, result = Mytrah:SaveConfig()
        notify(ok and "Global save complete" or "Save unavailable", tostring(result), ok and "Success" or "Error")
    end,
})
StorageLeft:AddButton({
    Title = "Load via Window",
    Icon = "download",
    Callback = function()
        local ok, result = Window:LoadConfig({ Animated = true, Notify = true })
        if not ok then notify("Load unavailable", tostring(result), "Error") end
    end,
})
StorageLeft:AddButton({
    Title = "Load via Mytrah",
    Icon = "download",
    Callback = function()
        local ok, result = Mytrah:LoadConfig({ Animated = true, Notify = true })
        if not ok then notify("Load unavailable", tostring(result), "Error") end
    end,
})
StorageLeft:AddButton({
    Title = "Clear saved configuration",
    Icon = "trash",
    Callback = function()
        local ok, result = Window:ClearConfig()
        notify(ok and "Configuration cleared" or "Clear unavailable", tostring(result or "Done"), ok and "Success" or "Error")
    end,
})

StorageRight:AddParagraph({
    Title = "Saved configuration",
    Icon = "folder",
    Content = Window:GetConfigPath(),
    Monospace = true,
})

local JsonLeft = JsonSubTab:AddSection({ Title = "Export", Icon = "upload", Side = "Left" })
local JsonRight = JsonSubTab:AddSection({ Title = "Import", Icon = "download", Side = "Right" })
local lastExport

JsonLeft:AddButton({
    Title = "Export JSON",
    Icon = "copy",
    Callback = function()
        lastExport = Window:ExportConfig()
        if type(setclipboard) == "function" then setclipboard(lastExport) else print(lastExport) end
        notify("JSON exported", "Copied when clipboard access is available.", "Success")
    end,
})
JsonRight:AddButton({
    Title = "Import last export",
    Icon = "download",
    Callback = function()
        if not lastExport then
            notify("Nothing to import", "Export the configuration first.", "Warning")
            return
        end
        Window:ImportConfig(lastExport)
        notify("JSON imported", "Values and theme were restored.", "Success")
    end,
})

local MethodsLeft = MethodsSubTab:AddSection({ Title = "Control methods", Icon = "terminal", Side = "Left" })
local MethodsRight = MethodsSubTab:AddSection({ Title = "Window methods", Icon = "layout-dashboard", Side = "Right" })
local basicSectionExpanded = true
local basicSectionRenamed = false

enabledToggle:OnChanged(function(value)
    print("OnChanged DemoEnabled:", value)
end)

MethodsLeft:AddButton({
    Title = "Set control values",
    Icon = "edit",
    Callback = function()
        enabledToggle:SetValue(true)
        speedSlider:SetValue(75)
        precisionSlider:SetValue(0.85)
        nameInput:SetValue("Mythra User")
        numericInput:SetValue(500)
        markerColor:SetValue(Color3.fromRGB(181, 72, 255))
        quickKeybind:SetValue(Enum.KeyCode.J)
        dynamicParagraph:SetValue("Updated through Paragraph:SetValue.")
    end,
})
MethodsLeft:AddButton({
    Title = "Rename toggle",
    Icon = "edit",
    Callback = function()
        enabledToggle:SetTitle("Demo enabled (renamed)")
    end,
})
MethodsLeft:AddButton({
    Title = "Toggle slider visibility",
    Icon = "eye",
    Callback = function()
        speedSlider:SetVisible(not speedSlider.Instance.Visible)
    end,
})
MethodsLeft:AddButton({
    Title = "Read flags",
    Icon = "search",
    Callback = function()
        local option = Window:GetOption("DemoMode")
        notify("Current values", "Mode: " .. tostring(option:GetValue()) .. " / Modules: " .. table.concat(modulesDropdown:GetValue(), ", "), "Info")
    end,
})
MethodsLeft:AddButton({
    Title = "Rename section",
    Icon = "edit",
    Callback = function()
        basicSectionRenamed = not basicSectionRenamed
        BasicLeft:SetTitle(basicSectionRenamed and "State (renamed)" or "State")
    end,
})
MethodsLeft:AddButton({
    Title = "Expand / collapse section",
    Icon = "chevron-down",
    Callback = function()
        basicSectionExpanded = not basicSectionExpanded
        BasicLeft:SetExpanded(basicSectionExpanded)
    end,
})
MethodsLeft:AddButton({
    Title = "Destroy divider",
    Icon = "trash",
    Callback = function()
        if dividerHandle then
            dividerHandle:Destroy()
            dividerHandle = nil
        end
    end,
})

MethodsRight:AddButton({ Title = "Select Controls tab", Icon = "layers", Callback = function() Window:SelectTab("Controls") end })
MethodsRight:AddButton({ Title = "Tab:Select", Icon = "layers", Callback = function() DirectTab:Select() end })
MethodsRight:AddButton({ Title = "SubTab:Select", Icon = "list", Callback = function() SelectionSubTab:Select() end })
MethodsRight:AddButton({
    Title = "Tab:SelectSubTab",
    Icon = "list",
    Callback = function()
        ControlsTab:SelectSubTab(TextSubTab)
    end,
})
MethodsRight:AddButton({
    Title = "Show visibility state",
    Icon = "eye",
    Callback = function()
        notify("Window visibility", tostring(Window:IsVisible()), "Info")
    end,
})
MethodsRight:AddButton({
    Title = "Update watermark text",
    Icon = "bookmark",
    Callback = function()
        if Watermark then
            Watermark:SetText("Mytrah v" .. Mytrah.Version .. " | " .. os.date("%H:%M:%S"))
        end
    end,
})

local LifecycleLeft = LifecycleSubTab:AddSection({ Title = "Safe actions", Icon = "shield", Side = "Left" })
local LifecycleRight = LifecycleSubTab:AddSection({ Title = "Unload", Icon = "power", Side = "Right" })
local disposableControl

LifecycleLeft:AddButton({ Title = "Open library info", Icon = "info", Callback = openLibraryInfo })
LifecycleLeft:AddButton({ Title = "Open runtime info", Icon = "terminal", Callback = openRuntimeInfo })
LifecycleLeft:AddButton({ Title = "Confirm close", Icon = "x", Callback = function() Window:ConfirmClose() end })
disposableControl = LifecycleLeft:AddButton({
    Title = "Disposable control",
    Icon = "circle",
    Callback = function()
        notify("Disposable control", "Use control:Destroy below.", "Info")
    end,
})
LifecycleLeft:AddButton({
    Title = "control:Destroy",
    Icon = "trash",
    Callback = function()
        if disposableControl then
            disposableControl:Destroy()
            disposableControl = nil
        end
    end,
})
LifecycleLeft:AddButton({
    Title = "Watermark:Destroy",
    Icon = "trash",
    Callback = function()
        if Watermark then
            Watermark:Destroy()
            Watermark = nil
        end
    end,
})
LifecycleRight:AddLabel({
    Title = "Lifecycle warning",
    Icon = "alert-circle",
    Content = "Unload and Destroy remove the active ScreenGui. Run the example again to reopen it.",
})
LifecycleRight:AddButton({
    Title = "Window:Destroy",
    Icon = "x",
    Callback = function()
        Window:Destroy()
    end,
})
LifecycleRight:AddButton({
    Title = "Mytrah:Unload",
    Icon = "power",
    Callback = function()
        Mytrah:Unload()
    end,
})

Watermark = Window:Watermark({
    Text = "Mytrah v" .. Mytrah.Version .. " | Complete Demo",
    Icon = "diamond",
    Position = UDim2.fromOffset(16, 16),
})
watermarkToggle:SetValue(true, true)

Window:SelectTab(ControlsTab)
Mytrah:Notify({
    Title = "Complete example loaded",
    Content = "Every public API is available from this demo.",
    Type = "Success",
    Duration = 5,
})

return {
    Library = Mytrah,
    Window = Window,
    Watermark = Watermark,
    Controls = {
        Enabled = enabledToggle,
        Speed = speedSlider,
        Precision = precisionSlider,
        Mode = modeDropdown,
        Modules = modulesDropdown,
        Color = markerColor,
        Name = nameInput,
        Target = numericInput,
        Keybind = quickKeybind,
    },
}
end

local Flow = Auth.new(Mytrah, {
    ApiBaseUrl = API,
    Title = "Mythra",
    Subtitle = "Secure account access",
    Theme = DEMO_THEME,
    RevalidateInterval = 300,
    OnAuthenticated = buildAuthenticated,
    OnLoggedOut = function(_, reason)
        warn("Mythra session ended: " .. tostring(reason or "signed out"))
    end,
})

return Flow
