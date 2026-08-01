local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local TextService = game:GetService("TextService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local Mytrah = {
    Version = "1.6.3",
    Options = {},
    Themes = {},
    Fonts = {},
    Icons = {},
}

local DEFAULT_FONT = Enum.Font.GothamMedium
local SEMIBOLD_FONT = Enum.Font.GothamBold
local TWEEN_FAST = TweenInfo.new(0.14, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local TWEEN_NORMAL = TweenInfo.new(0.22, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local TWEEN_POP = TweenInfo.new(0.26, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local TWEEN_CLOSE = TweenInfo.new(0.18, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
local SIDEBAR_WIDTH = 180
local HEADER_HEIGHT = 52
local CATEGORY_BAR_HEIGHT = 34
local WINDOW_RADIUS = 20
local PANEL_RADIUS = 14
local CONTROL_RADIUS = 11

Mytrah.Fonts.Gotham = {
    Regular = Enum.Font.GothamMedium,
    Semibold = Enum.Font.GothamBold,
}

Mytrah.Fonts["Source Sans"] = {
    Regular = Enum.Font.SourceSans,
    Semibold = Enum.Font.SourceSansSemibold,
}

Mytrah.Fonts.Roboto = {
    Regular = Enum.Font.Roboto,
    Semibold = Enum.Font.Roboto,
}

Mytrah.Fonts.Ubuntu = {
    Regular = Enum.Font.Ubuntu,
    Semibold = Enum.Font.Ubuntu,
}

Mytrah.Fonts["Roboto Mono"] = {
    Regular = Enum.Font.RobotoMono,
    Semibold = Enum.Font.RobotoMono,
}

Mytrah.Fonts.Cartoon = {
    Regular = Enum.Font.Cartoon,
    Semibold = Enum.Font.Cartoon,
}

Mytrah.Themes.Obsidian = {
    Background = Color3.fromRGB(9, 9, 11),
    Sidebar = Color3.fromRGB(10, 10, 12),
    Topbar = Color3.fromRGB(14, 14, 17),
    Section = Color3.fromRGB(17, 17, 20),
    Control = Color3.fromRGB(23, 23, 27),
    ControlHover = Color3.fromRGB(32, 27, 38),
    Border = Color3.fromRGB(29, 28, 35),
    Text = Color3.fromRGB(239, 238, 243),
    Muted = Color3.fromRGB(131, 128, 141),
    Accent = Color3.fromRGB(181, 72, 255),
    AccentDark = Color3.fromRGB(77, 28, 108),
    AccentText = Color3.fromRGB(255, 255, 255),
    Danger = Color3.fromRGB(248, 113, 113),
    Success = Color3.fromRGB(74, 222, 128),
    Warning = Color3.fromRGB(251, 191, 36),
}

Mytrah.Themes.Ember = {
    Background = Color3.fromRGB(15, 12, 13),
    Sidebar = Color3.fromRGB(20, 15, 16),
    Topbar = Color3.fromRGB(25, 18, 19),
    Section = Color3.fromRGB(33, 24, 24),
    Control = Color3.fromRGB(43, 31, 30),
    ControlHover = Color3.fromRGB(55, 39, 36),
    Border = Color3.fromRGB(71, 50, 47),
    Text = Color3.fromRGB(250, 245, 241),
    Muted = Color3.fromRGB(175, 155, 146),
    Accent = Color3.fromRGB(255, 132, 92),
    AccentDark = Color3.fromRGB(119, 55, 39),
    AccentText = Color3.fromRGB(32, 18, 15),
    Danger = Color3.fromRGB(248, 113, 113),
    Success = Color3.fromRGB(74, 222, 128),
    Warning = Color3.fromRGB(251, 191, 36),
}

Mytrah.Themes.Marine = {
    Background = Color3.fromRGB(8, 14, 20),
    Sidebar = Color3.fromRGB(10, 18, 25),
    Topbar = Color3.fromRGB(13, 23, 31),
    Section = Color3.fromRGB(17, 30, 40),
    Control = Color3.fromRGB(22, 39, 51),
    ControlHover = Color3.fromRGB(29, 51, 65),
    Border = Color3.fromRGB(39, 66, 82),
    Text = Color3.fromRGB(239, 247, 250),
    Muted = Color3.fromRGB(139, 166, 178),
    Accent = Color3.fromRGB(86, 201, 250),
    AccentDark = Color3.fromRGB(25, 86, 112),
    AccentText = Color3.fromRGB(6, 20, 28),
    Danger = Color3.fromRGB(251, 113, 133),
    Success = Color3.fromRGB(52, 211, 153),
    Warning = Color3.fromRGB(250, 204, 21),
}

Mytrah.Themes.Paper = {
    Background = Color3.fromRGB(238, 241, 244),
    Sidebar = Color3.fromRGB(228, 233, 238),
    Topbar = Color3.fromRGB(247, 248, 250),
    Section = Color3.fromRGB(250, 251, 252),
    Control = Color3.fromRGB(237, 241, 245),
    ControlHover = Color3.fromRGB(226, 232, 238),
    Border = Color3.fromRGB(201, 211, 220),
    Text = Color3.fromRGB(25, 32, 40),
    Muted = Color3.fromRGB(94, 108, 122),
    Accent = Color3.fromRGB(12, 157, 143),
    AccentDark = Color3.fromRGB(158, 225, 216),
    AccentText = Color3.fromRGB(255, 255, 255),
    Danger = Color3.fromRGB(220, 38, 38),
    Success = Color3.fromRGB(22, 163, 74),
    Warning = Color3.fromRGB(202, 138, 4),
}

Mytrah.Themes.Carbon = {
    Background = Color3.fromRGB(15, 16, 17),
    Sidebar = Color3.fromRGB(19, 20, 21),
    Topbar = Color3.fromRGB(23, 24, 25),
    Section = Color3.fromRGB(27, 28, 29),
    Control = Color3.fromRGB(34, 35, 36),
    ControlHover = Color3.fromRGB(44, 45, 46),
    Border = Color3.fromRGB(58, 59, 60),
    Text = Color3.fromRGB(246, 246, 244),
    Muted = Color3.fromRGB(161, 162, 158),
    Accent = Color3.fromRGB(229, 192, 87),
    AccentDark = Color3.fromRGB(89, 72, 27),
    AccentText = Color3.fromRGB(25, 22, 14),
    Danger = Color3.fromRGB(244, 99, 109),
    Success = Color3.fromRGB(90, 214, 145),
    Warning = Color3.fromRGB(246, 180, 67),
}

Mytrah.Themes.Forest = {
    Background = Color3.fromRGB(10, 16, 14),
    Sidebar = Color3.fromRGB(13, 22, 18),
    Topbar = Color3.fromRGB(17, 27, 23),
    Section = Color3.fromRGB(20, 34, 28),
    Control = Color3.fromRGB(27, 43, 35),
    ControlHover = Color3.fromRGB(37, 56, 46),
    Border = Color3.fromRGB(48, 72, 59),
    Text = Color3.fromRGB(240, 247, 242),
    Muted = Color3.fromRGB(142, 169, 151),
    Accent = Color3.fromRGB(116, 218, 142),
    AccentDark = Color3.fromRGB(33, 91, 53),
    AccentText = Color3.fromRGB(6, 31, 18),
    Danger = Color3.fromRGB(248, 113, 113),
    Success = Color3.fromRGB(74, 222, 128),
    Warning = Color3.fromRGB(245, 190, 75),
}

Mytrah.Themes.Crimson = {
    Background = Color3.fromRGB(15, 11, 14),
    Sidebar = Color3.fromRGB(21, 14, 18),
    Topbar = Color3.fromRGB(27, 17, 22),
    Section = Color3.fromRGB(35, 21, 28),
    Control = Color3.fromRGB(45, 27, 35),
    ControlHover = Color3.fromRGB(60, 34, 45),
    Border = Color3.fromRGB(76, 43, 56),
    Text = Color3.fromRGB(250, 242, 246),
    Muted = Color3.fromRGB(181, 145, 161),
    Accent = Color3.fromRGB(244, 96, 137),
    AccentDark = Color3.fromRGB(112, 35, 61),
    AccentText = Color3.fromRGB(255, 255, 255),
    Danger = Color3.fromRGB(255, 96, 108),
    Success = Color3.fromRGB(88, 213, 153),
    Warning = Color3.fromRGB(248, 190, 74),
}

Mytrah.Themes.Frost = {
    Background = Color3.fromRGB(233, 239, 246),
    Sidebar = Color3.fromRGB(221, 230, 240),
    Topbar = Color3.fromRGB(246, 249, 252),
    Section = Color3.fromRGB(250, 252, 254),
    Control = Color3.fromRGB(232, 238, 245),
    ControlHover = Color3.fromRGB(217, 227, 237),
    Border = Color3.fromRGB(190, 204, 218),
    Text = Color3.fromRGB(25, 37, 52),
    Muted = Color3.fromRGB(91, 111, 132),
    Accent = Color3.fromRGB(38, 113, 214),
    AccentDark = Color3.fromRGB(172, 206, 244),
    AccentText = Color3.fromRGB(255, 255, 255),
    Danger = Color3.fromRGB(211, 55, 65),
    Success = Color3.fromRGB(20, 145, 91),
    Warning = Color3.fromRGB(184, 119, 18),
}

Mytrah.Themes.Cartoon = {
    Background = Color3.fromRGB(242, 247, 255),
    Sidebar = Color3.fromRGB(255, 239, 247),
    Topbar = Color3.fromRGB(255, 255, 255),
    Section = Color3.fromRGB(255, 255, 255),
    Control = Color3.fromRGB(232, 241, 255),
    ControlHover = Color3.fromRGB(255, 234, 178),
    Border = Color3.fromRGB(148, 176, 221),
    Text = Color3.fromRGB(35, 43, 70),
    Muted = Color3.fromRGB(91, 107, 139),
    Accent = Color3.fromRGB(255, 91, 135),
    AccentDark = Color3.fromRGB(255, 205, 218),
    AccentText = Color3.fromRGB(255, 255, 255),
    Danger = Color3.fromRGB(224, 61, 89),
    Success = Color3.fromRGB(27, 176, 124),
    Warning = Color3.fromRGB(224, 145, 20),
}

Mytrah.Themes.Candy = {
    Background = Color3.fromRGB(250, 245, 252),
    Sidebar = Color3.fromRGB(239, 232, 249),
    Topbar = Color3.fromRGB(255, 252, 255),
    Section = Color3.fromRGB(255, 255, 255),
    Control = Color3.fromRGB(245, 236, 252),
    ControlHover = Color3.fromRGB(255, 231, 241),
    Border = Color3.fromRGB(205, 178, 222),
    Text = Color3.fromRGB(54, 39, 68),
    Muted = Color3.fromRGB(119, 99, 132),
    Accent = Color3.fromRGB(226, 79, 151),
    AccentDark = Color3.fromRGB(247, 192, 219),
    AccentText = Color3.fromRGB(255, 255, 255),
    Danger = Color3.fromRGB(211, 61, 91),
    Success = Color3.fromRGB(31, 169, 125),
    Warning = Color3.fromRGB(215, 135, 31),
}

Mytrah.Themes.Aurora = {
    Background = Color3.fromRGB(10, 20, 24),
    Sidebar = Color3.fromRGB(12, 28, 31),
    Topbar = Color3.fromRGB(16, 35, 38),
    Section = Color3.fromRGB(19, 42, 43),
    Control = Color3.fromRGB(24, 51, 52),
    ControlHover = Color3.fromRGB(34, 67, 65),
    Border = Color3.fromRGB(48, 92, 87),
    Text = Color3.fromRGB(238, 250, 245),
    Muted = Color3.fromRGB(139, 181, 171),
    Accent = Color3.fromRGB(251, 142, 102),
    AccentDark = Color3.fromRGB(113, 57, 45),
    AccentText = Color3.fromRGB(40, 18, 12),
    Danger = Color3.fromRGB(248, 103, 112),
    Success = Color3.fromRGB(82, 220, 166),
    Warning = Color3.fromRGB(246, 195, 77),
}

Mytrah.Icons = {
    activity = "rbxassetid://10709752035",
    ["alert-circle"] = "rbxassetid://10709752996",
    ["arrow-right"] = "rbxassetid://10709768347",
    bell = "rbxassetid://10709775704",
    bookmark = "rbxassetid://10709782154",
    box = "rbxassetid://10709782497",
    briefcase = "rbxassetid://10709782662",
    calendar = "rbxassetid://10709789505",
    check = "rbxassetid://10709790644",
    ["check-circle"] = "rbxassetid://10709790387",
    ["chevron-down"] = "rbxassetid://10709790948",
    ["chevron-right"] = "rbxassetid://10709791437",
    ["chevron-up"] = "rbxassetid://10709791523",
    circle = "rbxassetid://10709798174",
    clock = "rbxassetid://10709805144",
    code = "rbxassetid://10709810463",
    cog = "rbxassetid://10709810948",
    copy = "rbxassetid://10709812159",
    database = "rbxassetid://10709818996",
    diamond = "rbxassetid://10709819149",
    download = "rbxassetid://10723344270",
    edit = "rbxassetid://10734883598",
    eye = "rbxassetid://10723346959",
    file = "rbxassetid://10723374641",
    filter = "rbxassetid://10723375128",
    flag = "rbxassetid://10723375890",
    folder = "rbxassetid://10723387563",
    gamepad = "rbxassetid://10723395457",
    gem = "rbxassetid://10723396000",
    globe = "rbxassetid://10723404337",
    grid = "rbxassetid://10723404936",
    heart = "rbxassetid://10723406885",
    help = "rbxassetid://10723406988",
    history = "rbxassetid://10723407335",
    home = "rbxassetid://10723407389",
    info = "rbxassetid://10723415903",
    key = "rbxassetid://10723416652",
    layers = "rbxassetid://10723424505",
    ["layout-dashboard"] = "rbxassetid://10723424646",
    library = "rbxassetid://10723425615",
    link = "rbxassetid://10723426722",
    list = "rbxassetid://10723433811",
    lock = "rbxassetid://10723434711",
    mail = "rbxassetid://10734885430",
    maximize = "rbxassetid://10734886735",
    menu = "rbxassetid://10734887784",
    message = "rbxassetid://10734888228",
    minimize = "rbxassetid://10734895698",
    minus = "rbxassetid://10734896206",
    monitor = "rbxassetid://10734896881",
    moon = "rbxassetid://10734897102",
    package = "rbxassetid://10734909540",
    palette = "rbxassetid://10734910430",
    play = "rbxassetid://10734923549",
    plus = "rbxassetid://10734924532",
    power = "rbxassetid://10734930466",
    refresh = "rbxassetid://10734933056",
    rocket = "rbxassetid://10734934585",
    save = "rbxassetid://10734941499",
    search = "rbxassetid://10734943674",
    send = "rbxassetid://10734943902",
    server = "rbxassetid://10734949856",
    settings = "rbxassetid://10734950309",
    shield = "rbxassetid://10734951847",
    sliders = "rbxassetid://10734963400",
    star = "rbxassetid://10734966248",
    sun = "rbxassetid://10734974297",
    target = "rbxassetid://10734977012",
    sword = "rbxassetid://10734975486",
    swords = "rbxassetid://10734975692",
    utensils = "rbxassetid://10747373821",
    ["heart-pulse"] = "rbxassetid://10723406795",
    keyboard = "rbxassetid://10723416765",
    bolt = "rbxassetid://10709752035",
    terminal = "rbxassetid://10734982144",
    timer = "rbxassetid://10734984606",
    trash = "rbxassetid://10747362393",
    ["trending-up"] = "rbxassetid://10747363465",
    upload = "rbxassetid://10747366434",
    user = "rbxassetid://10747373176",
    users = "rbxassetid://10747373426",
    wallet = "rbxassetid://10747376205",
    wrench = "rbxassetid://10747383470",
    x = "rbxassetid://10747384394",
}

local function create(className, properties)
    local object = Instance.new(className)
    local parent = properties and properties.Parent

    if properties then
        for property, value in pairs(properties) do
            if property ~= "Parent" then
                object[property] = value
            end
        end
    end

    if parent then
        object.Parent = parent
    end

    return object
end

local function addCorner(parent, radius)
    parent.ClipsDescendants = true
    return create("UICorner", {
        CornerRadius = UDim.new(0, radius or CONTROL_RADIUS),
        Parent = parent,
    })
end

local function addStroke(parent, color, transparency, thickness)
    return create("UIStroke", {
        Color = color,
        Transparency = transparency or 0,
        Thickness = thickness or 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = parent,
    })
end

local function addPadding(parent, left, right, top, bottom)
    return create("UIPadding", {
        PaddingLeft = UDim.new(0, left or 0),
        PaddingRight = UDim.new(0, right or left or 0),
        PaddingTop = UDim.new(0, top or left or 0),
        PaddingBottom = UDim.new(0, bottom or top or left or 0),
        Parent = parent,
    })
end

local function tween(object, properties, info)
    if not object or not object.Parent then
        return nil
    end

    local animation = TweenService:Create(object, info or TWEEN_FAST, properties)
    animation:Play()
    return animation
end

local function safeCallback(callback, ...)
    if type(callback) ~= "function" then
        return
    end

    local arguments = table.pack(...)
    task.spawn(function()
        local success, message = xpcall(function()
            callback(table.unpack(arguments, 1, arguments.n))
        end, debug.traceback)

        if not success then
            warn("[Mytrah] Callback error:\n" .. tostring(message))
        end
    end)
end

local function safeThemeCallback(callback, ...)
    if type(callback) ~= "function" then
        return
    end

    local arguments = table.pack(...)
    local success, message = xpcall(function()
        callback(table.unpack(arguments, 1, arguments.n))
    end, debug.traceback)

    if not success then
        warn("[Mytrah] Theme callback error:\n" .. tostring(message))
    end
end

local function trim(value)
    return tostring(value):match("^%s*(.-)%s*$")
end

local function resolveTheme(theme)
    if type(theme) == "table" then
        return theme, "Custom"
    end

    if type(theme) ~= "string" then
        return nil, tostring(theme)
    end

    local requested = trim(theme)
    if Mytrah.Themes[requested] then
        return Mytrah.Themes[requested], requested
    end

    local normalized = string.lower(requested)
    for name, candidate in pairs(Mytrah.Themes) do
        if string.lower(name) == normalized then
            return candidate, name
        end
    end

    return nil, requested
end

local function resolveFont(font)
    if typeof(font) == "EnumItem" and font.EnumType == Enum.Font then
        return { Regular = font, Semibold = font }, font.Name
    end

    if type(font) == "table" then
        local regular = font.Regular or font.Font or font[1]
        local semibold = font.Semibold or font.Bold or font[2] or regular
        if typeof(regular) == "EnumItem" and regular.EnumType == Enum.Font
            and typeof(semibold) == "EnumItem" and semibold.EnumType == Enum.Font
        then
            return { Regular = regular, Semibold = semibold }, tostring(font.Name or "Custom")
        end
        return nil, "Custom"
    end

    local requested = trim(font or "Gotham")
    if Mytrah.Fonts[requested] then
        return Mytrah.Fonts[requested], requested
    end

    local normalized = string.lower(requested)
    for name, preset in pairs(Mytrah.Fonts) do
        if string.lower(name) == normalized then
            return preset, name
        end
    end
    local enumFont = Enum.Font[requested]
    if enumFont then
        return { Regular = enumFont, Semibold = enumFont }, requested
    end
    return nil, requested
end

local function resolveIcon(icon)
    if icon == nil or icon == false then
        return nil
    end

    if type(icon) == "number" then
        return "rbxassetid://" .. tostring(icon)
    end

    if type(icon) ~= "string" then
        return nil
    end

    local cleaned = string.lower(trim(icon))
        :gsub("^lucide[/%-]", "")
        :gsub("^solar/", "")
        :gsub("%-bold$", "")
    if Mytrah.Icons[cleaned] then
        return Mytrah.Icons[cleaned]
    end

    if cleaned:match("^%d+$") then
        return "rbxassetid://" .. cleaned
    end

    if icon:match("^rbxasset") or icon:match("^https?://") then
        return icon
    end

    return Mytrah.Icons.circle
end

local function newIcon(parent, icon, size, color)
    local image = resolveIcon(icon)
    local label = create("ImageLabel", {
        Name = "Icon",
        BackgroundTransparency = 1,
        Image = image or "",
        ImageColor3 = color or Color3.new(1, 1, 1),
        ImageTransparency = image and 0 or 1,
        Size = UDim2.fromOffset(size or 18, size or 18),
        Parent = parent,
    })
    return label
end

local function mix(a, b, alpha)
    return a:Lerp(b, alpha)
end

local function pointInside(gui, point)
    if not gui or not gui.Parent then
        return false
    end

    local position = gui.AbsolutePosition
    local size = gui.AbsoluteSize
    return point.X >= position.X
        and point.Y >= position.Y
        and point.X <= position.X + size.X
        and point.Y <= position.Y + size.Y
end

local function colorToHex(color)
    return string.format(
        "#%02X%02X%02X",
        math.floor(color.R * 255 + 0.5),
        math.floor(color.G * 255 + 0.5),
        math.floor(color.B * 255 + 0.5)
    )
end

local function hexToColor(value)
    if typeof(value) == "Color3" then
        return value
    end

    if type(value) ~= "string" then
        return nil
    end

    local hex = value:gsub("#", "")
    if #hex ~= 6 or not hex:match("^[%x]+$") then
        return nil
    end

    return Color3.fromRGB(
        tonumber(hex:sub(1, 2), 16),
        tonumber(hex:sub(3, 4), 16),
        tonumber(hex:sub(5, 6), 16)
    )
end

local function getGuiParent()
    if type(gethui) == "function" then
        local success, result = pcall(gethui)
        if success and result then
            return result
        end
    end

    local player = Players.LocalPlayer
    if player then
        local playerGui = player:FindFirstChildOfClass("PlayerGui") or player:WaitForChild("PlayerGui", 5)
        if playerGui then
            return playerGui
        end
    end

    return CoreGui
end

local function normalizeWindowSize(value)
    if typeof(value) == "UDim2" then
        return Vector2.new(value.X.Offset, value.Y.Offset)
    end

    if typeof(value) == "Vector2" then
        return value
    end

    return Vector2.new(680, 420)
end

local function clampWindowSize(value, minimum, maximum)
    return Vector2.new(
        math.clamp(math.floor(value.X + 0.5), minimum.X, maximum.X),
        math.clamp(math.floor(value.Y + 0.5), minimum.Y, maximum.Y)
    )
end

local function offsetPosition(position, x, y)
    return UDim2.new(
        position.X.Scale,
        position.X.Offset + x,
        position.Y.Scale,
        position.Y.Offset + y
    )
end

local function isTextObject(object)
    return object:IsA("TextLabel") or object:IsA("TextButton") or object:IsA("TextBox")
end

local function canUseConfigStorage()
    return type(readfile) == "function" and type(writefile) == "function"
        and type(makefolder) == "function"
end

local function configPath()
    local gameId = tonumber(game.GameId) or 0
    if gameId == 0 then
        gameId = tonumber(game.PlaceId) or 0
    end

    local player = Players.LocalPlayer
    local userId = player and tonumber(player.UserId) or 0
    return string.format("Mytrah/Configs/%d/%d.json", gameId, userId)
end

local function getExecutorName()
    local providers = { identifyexecutor, getexecutorname, getexecutor }
    for _, provider in ipairs(providers) do
        if type(provider) == "function" then
            local success, name = pcall(provider)
            if success and type(name) == "string" and trim(name) ~= "" then
                return trim(name)
            end
        end
    end
    return "Unknown executor"
end

local function isMobileViewport()
    if not UserInputService.TouchEnabled then
        return false
    end
    local camera = workspace.CurrentCamera
    local viewport = camera and camera.ViewportSize or Vector2.new(1920, 1080)
    return not UserInputService.KeyboardEnabled
        or not UserInputService.MouseEnabled
        or math.min(viewport.X, viewport.Y) <= 600
end

function Mytrah:RegisterIcon(name, asset)
    assert(type(name) == "string", "Icon name must be a string")
    local resolved = resolveIcon(asset)
    assert(resolved, "Icon asset must be an asset ID or image URL")
    self.Icons[string.lower(name)] = resolved
    return resolved
end

local Window = {}
Window.__index = Window

function Window:_connect(signal, callback)
    local connection = signal:Connect(callback)
    table.insert(self._connections, connection)
    return connection
end

function Window:_paint(object, property, themeKey)
    table.insert(self._themeBindings, {
        Object = object,
        Property = property,
        Key = themeKey,
    })
    object[property] = self.Theme[themeKey]
end

function Window:_onTheme(callback)
    table.insert(self._themeCallbacks, callback)
    safeThemeCallback(callback, self.Theme)
end

function Window:_makeIcon(parent, icon, size, colorKey)
    local label = newIcon(parent, icon, size, self.Theme[colorKey or "Muted"])
    if colorKey then
        self:_paint(label, "ImageColor3", colorKey)
    end
    return label
end

function Window:_attachTooltip(gui, text)
    if not text or text == "" then
        return
    end

    self:_connect(gui.MouseEnter, function()
        if self._destroyed then
            return
        end

        self._tooltip.TextLabel.Text = text
        local bounds = TextService:GetTextSize(text, 12, self.Fonts.Regular, Vector2.new(260, 100))
        self._tooltip.Size = UDim2.fromOffset(bounds.X + 18, 28)
        local viewport = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1920, 1080)
        local position = gui.AbsolutePosition
        local size = gui.AbsoluteSize
        local x = position.X + size.X + 8
        local y = position.Y + math.floor((size.Y - 28) / 2)
        if x + self._tooltip.AbsoluteSize.X > viewport.X - 8 then
            x = position.X - self._tooltip.AbsoluteSize.X - 8
        end
        self._tooltip.Position = UDim2.fromOffset(math.max(8, x), math.clamp(y, 8, math.max(8, viewport.Y - 36)))
        self._tooltip.Visible = true
    end)

    self:_connect(gui.MouseLeave, function()
        self._tooltip.Visible = false
    end)
end

function Window:_closePopup()
    if self._popupConnection then
        self._popupConnection:Disconnect()
        self._popupConnection = nil
    end

    if self._activePopup then
        self._activePopup:Destroy()
        self._activePopup = nil
    end
end

function Window:_openPopup(popup, anchor)
    self:_closePopup()
    self._activePopup = popup
    popup.Parent = self.ScreenGui

    task.defer(function()
        if self._destroyed or self._activePopup ~= popup then
            return
        end

        self._popupConnection = UserInputService.InputBegan:Connect(function(input)
            local inputType = input.UserInputType
            if inputType ~= Enum.UserInputType.MouseButton1 and inputType ~= Enum.UserInputType.Touch then
                return
            end

            local point = input.Position
            if inputType == Enum.UserInputType.MouseButton1 then
                point = UserInputService:GetMouseLocation()
            end
            if not pointInside(popup, point) and not pointInside(anchor, point) then
                self:_closePopup()
            end
        end)
    end)
end

function Window:SetTheme(theme)
    local nextTheme, themeName = resolveTheme(theme)

    assert(nextTheme, "Unknown Mytrah theme: " .. tostring(theme))

    local base = Mytrah.Themes.Obsidian
    local merged = {}
    for key, value in pairs(base) do
        merged[key] = nextTheme[key] or value
    end

    self.Theme = merged
    self.ThemeName = themeName
    self:_closePopup()

    for _, binding in ipairs(self._themeBindings) do
        local target = merged[binding.Key]
        if binding.Object and binding.Object.Parent and target ~= nil then
            local animated = pcall(function()
                tween(binding.Object, { [binding.Property] = target }, TWEEN_NORMAL)
            end)
            if not animated then
                pcall(function()
                    binding.Object[binding.Property] = target
                end)
            end
        end
    end

    for _, callback in ipairs(self._themeCallbacks) do
        safeThemeCallback(callback, merged)
    end

    if not self._loadingConfig then
        self:_queueConfigSave()
    end

    return self
end

function Window:SetSettingsCallback(callback)
    assert(callback == nil or type(callback) == "function", "Settings callback must be a function or nil")
    self._settingsCallback = callback
    if self.SettingsButton then
        self.SettingsButton.Visible = callback ~= nil
    end
    self:_updateHeaderActionLayout()
    return self
end

function Window:SetToggleKey(key)
    if type(key) == "string" then
        key = Enum.KeyCode[key]
    end
    if typeof(key) ~= "EnumItem" or key.EnumType ~= Enum.KeyCode then
        key = Enum.KeyCode.Unknown
    end
    self._toggleKey = key
    self.ToggleKey = key
    if self.VisibilityToggleLabel then
        self.VisibilityToggleLabel.Text = key.Name
    end
    if self._keybindEntries then
        self:_refreshKeybindPanel()
    end
    return self
end

function Window:GetToggleKey()
    return self._toggleKey
end

local function panelKeyName(value)
    if typeof(value) ~= "EnumItem" then
        return "None"
    end
    local aliases = {
        LeftControl = "LControl",
        RightControl = "RControl",
        LeftShift = "LShift",
        RightShift = "RShift",
        LeftAlt = "LAlt",
        RightAlt = "RAlt",
        Backquote = "`",
    }
    return aliases[value.Name] or value.Name
end

function Window:_refreshKeybindPanel()
    if self.KeybindPanel and self.KeybindPanel.Parent then
        local count = #self._keybindEntries
        self.KeybindPanel.Size = UDim2.fromOffset(244, math.clamp(58 + count * 48, 96, 380))
    end
    for _, entry in ipairs(self._keybindEntries or {}) do
        if entry.Row and entry.Row.Parent then
            local active = false
            if entry.IsActive then
                pcall(function()
                    active = entry.IsActive() == true
                end)
            end
            local value = entry.GetValue and entry.GetValue() or Enum.KeyCode.Unknown
            entry.Key.Text = panelKeyName(value)
            entry.Status.Text = active and "ACTIVE" or "INACTIVE"
            entry.Status.TextColor3 = active and self.Theme.Success or self.Theme.Muted
            entry.Name.TextColor3 = active and self.Theme.Text or self.Theme.Muted
            entry.Key.TextColor3 = active and self.Theme.Success or self.Theme.Accent
            entry.Dot.BackgroundColor3 = active and self.Theme.Success or self.Theme.Border
            entry.Row.BackgroundColor3 = active and mix(self.Theme.Success, self.Theme.Control, 0.86) or self.Theme.Control
            if entry.MobileButton and entry.MobileButton.Parent then
                entry.MobileButton.BackgroundColor3 = active
                    and mix(self.Theme.Success, self.Theme.Control, 0.82)
                    or self.Theme.Control
                entry.MobileLabel.TextColor3 = active and self.Theme.Success or self.Theme.Muted
                entry.MobileDot.BackgroundColor3 = active and self.Theme.Success or self.Theme.Border
            end
        end
    end
end

function Window:_refreshColumnViewports()
    for _, refresh in ipairs(self._columnRefreshers or {}) do
        pcall(refresh)
    end
end

function Window:_updateResponsiveLayout()
    local mobile = isMobileViewport()

    if self.VisibilityToggle then
        self.VisibilityToggle.Visible = not mobile
    end
    if self.Profile then
        local reserved = mobile and -52 or -86
        self.Profile.Name.Size = UDim2.new(1, reserved, 0, 14)
        self.Profile.Handle.Size = UDim2.new(1, reserved, 0, 11)
    end

    local function updateOwner(owner, directSectionsOnly)
        if not owner.LeftColumn or not owner.RightColumn then
            return
        end

        local leftViewport = owner.LeftColumn.Parent
        local rightViewport = owner.RightColumn.Parent
        if not leftViewport or not rightViewport then
            return
        end
        owner.LeftColumn.ScrollBarThickness = mobile and 4 or 0
        owner.LeftColumn.ScrollBarImageTransparency = mobile and 0.35 or 1
        owner.RightColumn.ScrollBarThickness = mobile and 4 or 0
        owner.RightColumn.ScrollBarImageTransparency = mobile and 0.35 or 1
        local parent = leftViewport and leftViewport.Parent
        local leftMask = parent and parent:FindFirstChild("LeftTopMask")
        local rightMask = parent and parent:FindFirstChild("RightTopMask")
        local top = 13

        if mobile then
            leftViewport.Position = UDim2.fromOffset(14, top)
            leftViewport.Size = UDim2.new(1, -28, 1, -top)
            rightViewport.Visible = false
            if leftMask then
                leftMask.Position = UDim2.fromOffset(14, 0)
                leftMask.Size = UDim2.new(1, -28, 0, top)
            end
            if rightMask then
                rightMask.Visible = false
            end
        else
            leftViewport.Position = UDim2.fromOffset(14, top)
            leftViewport.Size = UDim2.new(0.5, -21, 1, -top)
            rightViewport.Position = UDim2.new(0.5, 7, 0, top)
            rightViewport.Size = UDim2.new(0.5, -21, 1, -top)
            rightViewport.Visible = true
            if leftMask then
                leftMask.Position = UDim2.fromOffset(14, 0)
                leftMask.Size = UDim2.new(0.5, -21, 0, top)
            end
            if rightMask then
                rightMask.Position = UDim2.new(0.5, 7, 0, 0)
                rightMask.Size = UDim2.new(0.5, -21, 0, top)
                rightMask.Visible = true
            end
        end

        local order = 0
        for _, section in ipairs(owner.Sections or {}) do
            if not directSectionsOnly or not section.SubTab then
                order = order + 1
                section.Frame.Parent = mobile
                    and owner.LeftColumn
                    or (section.Side == "Left" and owner.LeftColumn or owner.RightColumn)
                section.Frame.LayoutOrder = mobile and order or section._sideOrder
            end
        end
    end

    for _, tab in ipairs(self.Tabs) do
        updateOwner(tab, true)
        for _, subtab in ipairs(tab.SubTabs or {}) do
            updateOwner(subtab, false)
        end
    end

    self:_refreshColumnViewports()
end

function Window:_createMobileKeybinds()
    if self.MobileKeybindsGui then
        return
    end
    local parent = self.ScreenGui and self.ScreenGui.Parent or getGuiParent()
    local gui = create("ScreenGui", {
        Name = "MytrahMobileKeybinds",
        DisplayOrder = (self.ScreenGui and self.ScreenGui.DisplayOrder or 850) + 3,
        IgnoreGuiInset = true,
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        Parent = parent,
    })
    self.MobileKeybindsGui = gui
    self._mobileKeybindEntries = {}
end

function Window:_registerMobileKeybind(control, options)
    if options.Mobile == false or not isMobileViewport() then
        return
    end
    self:_createMobileKeybinds()
    local index = #self._mobileKeybindEntries + 1
    local button = create("TextButton", {
        Name = "Keybind_" .. tostring(index),
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.new(1, -18, 1, -(62 + (index - 1) * 42)),
        Size = UDim2.fromOffset(82, 32),
        BackgroundTransparency = 0.05,
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Text = "",
        Active = true,
        ZIndex = 450,
        Parent = self.MobileKeybindsGui,
    })
    addCorner(button, 10)
    local stroke = addStroke(button, self.Theme.Border, 0.2, 1)
    self:_paint(button, "BackgroundColor3", "Control")
    self:_paint(stroke, "Color", "Border")
    local title = tostring(options.MobileTitle or options.Title or options.Flag or "Keybind")
    if #title > 8 then
        title = title:sub(1, 8)
    end
    local label = create("TextLabel", {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(10, 0),
        Size = UDim2.new(1, -26, 1, 0),
        Font = SEMIBOLD_FONT,
        Text = title,
        TextSize = 9,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 451,
        Parent = button,
    })
    self:_paint(label, "TextColor3", "Muted")
    local dot = create("Frame", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -9, 0.5, 0),
        Size = UDim2.fromOffset(6, 6),
        BorderSizePixel = 0,
        ZIndex = 451,
        Parent = button,
    })
    addCorner(dot, 3)
    self:_paint(dot, "BackgroundColor3", "Border")

    local dragging = false
    local dragStart
    local startPosition
    local tapDistance = 0
    self:_connect(button.InputBegan, function(input)
        if input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseButton1
        then
            dragging = true
            dragStart = input.Position
            startPosition = button.Position
            tapDistance = 0
        end
    end)
    self:_connect(UserInputService.InputChanged, function(input)
        if not dragging then
            return
        end
        if input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseMovement
        then
            local delta = input.Position - dragStart
            tapDistance = delta.Magnitude
            button.Position = UDim2.new(
                startPosition.X.Scale,
                startPosition.X.Offset + delta.X,
                startPosition.Y.Scale,
                startPosition.Y.Offset + delta.Y
            )
        end
    end)
    self:_connect(UserInputService.InputEnded, function(input)
        if input.UserInputType ~= Enum.UserInputType.Touch
            and input.UserInputType ~= Enum.UserInputType.MouseButton1
        then
            return
        end
        local wasTap = dragging and tapDistance < 8
        dragging = false
        if not wasTap then
            return
        end
        local activeControl = options.ActiveFlag and self.Options[options.ActiveFlag]
        if options.MobileCallback then
            safeCallback(options.MobileCallback)
        elseif activeControl then
            activeControl:SetValue(not activeControl.Value)
        else
            safeCallback(options.Callback, control.Value)
        end
        self:_refreshKeybindPanel()
    end)

    local mobileEntry = {
        Button = button,
        Label = label,
        Dot = dot,
        Control = control,
        Options = options,
    }
    table.insert(self._mobileKeybindEntries, mobileEntry)
    return mobileEntry
end

function Window:_registerKeybind(control, options, bindButton)
    self._keybindEntries = self._keybindEntries or {}
    local entry = {
        Title = tostring(options.Title or options.Flag or "Keybind"),
        GetValue = function()
            return control.Value
        end,
        IsActive = function()
            local activeControl = options.ActiveFlag and self.Options[options.ActiveFlag]
            if activeControl then
                return activeControl.Value == true
            end
            return control._active == true
        end,
    }

    if self._keybindList then
        local row = create("Frame", {
            Name = "Keybind_" .. tostring(#self._keybindEntries + 1),
            Size = UDim2.new(1, 0, 0, 42),
            BackgroundTransparency = 0.05,
            BorderSizePixel = 0,
            LayoutOrder = #self._keybindEntries + 1,
            ZIndex = 82,
            Parent = self._keybindList,
        })
        addCorner(row, 9)
        self:_paint(row, "BackgroundColor3", "Control")
        local icon = self:_makeIcon(row, options.Icon or "keyboard", 14, "Accent")
        icon.AnchorPoint = Vector2.new(0, 0.5)
        icon.Position = UDim2.new(0, 11, 0.5, 0)
        icon.ZIndex = 83
        local title = create("TextLabel", {
            Name = "Name",
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(34, 5),
            Size = UDim2.new(1, -122, 0, 16),
            Font = SEMIBOLD_FONT,
            Text = entry.Title,
            TextSize = 10,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            ZIndex = 83,
            Parent = row,
        })
        self:_paint(title, "TextColor3", "Text")
        local status = create("TextLabel", {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(34, 22),
            Size = UDim2.new(1, -122, 0, 12),
            Font = DEFAULT_FONT,
            Text = "OFF",
            TextSize = 9,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 83,
            Parent = row,
        })
        local dot = create("Frame", {
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -88, 0.5, 0),
            Size = UDim2.fromOffset(6, 6),
            BorderSizePixel = 0,
            ZIndex = 83,
            Parent = row,
        })
        addCorner(dot, 3)
        self:_paint(dot, "BackgroundColor3", "Border")
        local key = create(options.Prompt and "TextButton" or "TextLabel", {
            Name = "Key",
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, -10, 0.5, 0),
            Size = UDim2.fromOffset(68, 26),
            BackgroundTransparency = 0.05,
            BorderSizePixel = 0,
            Font = SEMIBOLD_FONT,
            Text = "None",
            TextSize = 10,
            TextXAlignment = Enum.TextXAlignment.Center,
            ZIndex = 83,
            Parent = row,
        })
        addCorner(key, 7)
        self:_paint(key, "BackgroundColor3", "Background")
        if options.Prompt then
            key.AutoButtonColor = false
            self:_connect(key.Activated, options.Prompt)
            self:_attachTooltip(key, "Change shortcut")
        end
        entry.Row = row
        entry.Status = status
        entry.Key = key
        entry.Name = title
        entry.Dot = dot
    end

    table.insert(self._keybindEntries, entry)
    local mobileEntry = self:_registerMobileKeybind(control, options)
    if mobileEntry then
        entry.MobileButton = mobileEntry.Button
        entry.MobileLabel = mobileEntry.Label
        entry.MobileDot = mobileEntry.Dot
    end
    if options.ActiveFlag then
        local activeControl = self.Options[options.ActiveFlag]
        if activeControl and activeControl._changed then
            self:_connect(activeControl._changed.Event, function()
                self:_refreshKeybindPanel()
            end)
        end
    end
    self:_refreshKeybindPanel()
    return control
end

function Window:_createKeybindPanel()
    if self.KeybindScreenGui then
        self.KeybindScreenGui:Destroy()
    end
    self._keybindEntries = {}
    local parent = self.ScreenGui and self.ScreenGui.Parent or getGuiParent()
    local keybindGui = create("ScreenGui", {
        Name = "MytrahKeybinds",
        DisplayOrder = (self.ScreenGui and self.ScreenGui.DisplayOrder or 850) + 2,
        IgnoreGuiInset = true,
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        Parent = parent,
    })
    self.KeybindScreenGui = keybindGui
    local panel = create("Frame", {
        Name = "KeybindPanel",
        AnchorPoint = Vector2.new(0, 0),
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.fromOffset(244, 96),
        Visible = false,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ZIndex = 80,
        Parent = keybindGui,
    })
    local camera = workspace.CurrentCamera
    local viewport = camera and camera.ViewportSize or Vector2.new(1920, 1080)
    panel.Position = UDim2.fromOffset(math.max(6, viewport.X - 264), math.max(6, math.floor(viewport.Y * 0.5 - 130)))
    addCorner(panel, 13)
    local stroke = addStroke(panel, self.Theme.Border, 0.15, 1)
    self:_paint(panel, "BackgroundColor3", "Section")
    self:_paint(stroke, "Color", "Border")
    local title = create("TextLabel", {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(14, 8),
        Size = UDim2.new(1, -30, 0, 19),
        Font = SEMIBOLD_FONT,
        Text = "KEYBINDS",
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 81,
        Parent = panel,
    })
    self:_paint(title, "TextColor3", "Text")
    local subtitle = create("TextLabel", {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(14, 27),
        Size = UDim2.new(1, -30, 0, 14),
        Font = DEFAULT_FONT,
        Text = "Configured shortcuts and live state",
        TextSize = 9,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 81,
        Parent = panel,
    })
    self:_paint(subtitle, "TextColor3", "Muted")
    local list = create("ScrollingFrame", {
        Name = "List",
        Position = UDim2.fromOffset(10, 48),
        Size = UDim2.new(1, -20, 1, -56),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        CanvasSize = UDim2.new(),
        ScrollBarThickness = 2,
        ScrollBarImageTransparency = 0.35,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ZIndex = 81,
        Parent = panel,
    })
    self:_paint(list, "ScrollBarImageColor3", "Accent")
    local layout = create("UIListLayout", {
        Padding = UDim.new(0, 6),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = list,
    })
    self:_connect(layout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
        list.CanvasSize = UDim2.fromOffset(0, layout.AbsoluteContentSize.Y + 6)
    end)
    self.KeybindPanel = panel
    self._keybindList = list
    local dragHandle = create("TextButton", {
        Name = "DragHandle",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, -42, 0, 42),
        AutoButtonColor = false,
        Text = "",
        ZIndex = 84,
        Parent = panel,
    })
    local closeButton = create("ImageButton", {
        Name = "Close",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -9, 0, 20),
        Size = UDim2.fromOffset(22, 22),
        AutoButtonColor = false,
        BackgroundTransparency = 1,
        ImageTransparency = 1,
        ZIndex = 84,
        Parent = panel,
    })
    addCorner(closeButton, 7)
    local closeIcon = self:_makeIcon(closeButton, "x", 12, "Muted")
    closeIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    closeIcon.Position = UDim2.fromScale(0.5, 0.5)
    closeIcon.ZIndex = 85
    self:_connect(closeButton.Activated, function()
        self:ToggleKeybindPanel(false)
    end)
    self:_connect(closeButton.MouseEnter, function()
        tween(closeButton, { BackgroundTransparency = 0.2, BackgroundColor3 = self.Theme.ControlHover }, TWEEN_FAST)
        tween(closeIcon, { ImageColor3 = self.Theme.Text }, TWEEN_FAST)
    end)
    self:_connect(closeButton.MouseLeave, function()
        tween(closeButton, { BackgroundTransparency = 1 }, TWEEN_FAST)
        tween(closeIcon, { ImageColor3 = self.Theme.Muted }, TWEEN_FAST)
    end)
    local dragging = false
    local dragStart
    local startPosition
    local function clampPosition(position)
        local camera = workspace.CurrentCamera
        local viewport = camera and camera.ViewportSize or Vector2.new(1920, 1080)
        local size = panel.AbsoluteSize
        local x = math.clamp(position.X.Offset, 6, math.max(6, viewport.X - size.X - 6))
        local y = math.clamp(position.Y.Offset, 6, math.max(6, viewport.Y - size.Y - 6))
        return UDim2.fromOffset(x, y)
    end
    self:_connect(dragHandle.InputBegan, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPosition = panel.Position
        end
    end)
    self:_connect(UserInputService.InputChanged, function(input)
        if not dragging then
            return
        end
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            local delta = input.Position - dragStart
            panel.Position = clampPosition(UDim2.fromOffset(startPosition.X.Offset + delta.X, startPosition.Y.Offset + delta.Y))
        end
    end)
    self:_connect(UserInputService.InputEnded, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    self:_registerKeybind({ Value = self._toggleKey }, {
        Title = "Interface",
        MobileTitle = "UI",
        Icon = "eye",
        MobileCallback = function()
            self:Toggle()
        end,
        Prompt = function()
            self:PromptToggleKey()
        end,
    }, nil)
    local interfaceEntry = self._keybindEntries[1]
    interfaceEntry.GetValue = function()
        return self._toggleKey
    end
    interfaceEntry.IsActive = function()
        return self:IsVisible()
    end
    self:_refreshKeybindPanel()
end

function Window:ToggleKeybindPanel(force)
    if not self.KeybindPanel then
        return self
    end
    self.KeybindPanel.Visible = type(force) == "boolean" and force or not self.KeybindPanel.Visible
    if self.KeybindPanel.Visible then
        self.KeybindPanel.Position = self.KeybindPanel.Position
    end
    self:_refreshKeybindPanel()
    return self
end

function Window:PromptToggleKey()
    if self._destroyed or self._destroying then
        return nil
    end

    local dialog
    local connection
    local capturing = true
    local function stopCapture()
        capturing = false
        if connection then
            connection:Disconnect()
            connection = nil
        end
    end

    dialog = self:Dialog({
        Title = "Interface visibility key",
        Subtitle = "Current key: " .. panelKeyName(self._toggleKey),
        Icon = "keyboard",
        Width = 430,
        Height = 238,
        Content = "Press a keyboard key to replace the shortcut used to show or hide the complete Mythra interface. Press Escape to cancel.",
        Buttons = {
            {
                Title = "Cancel",
                Width = 82,
                Primary = false,
                Callback = stopCapture,
            },
        },
    })

    self._capturingToggleKey = true
    connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not capturing then
            return
        end
        if not dialog.Instance or not dialog.Instance.Parent then
            stopCapture()
            self._capturingToggleKey = false
            return
        end
        if gameProcessed or input.UserInputType ~= Enum.UserInputType.Keyboard then
            return
        end
        if input.KeyCode == Enum.KeyCode.Escape then
            stopCapture()
            self._capturingToggleKey = false
            dialog:Close()
            return
        end

        self:SetToggleKey(input.KeyCode)
        stopCapture()
        self._capturingToggleKey = false
        dialog:SetStatus("Visibility key set to " .. input.KeyCode.Name, "Success")
        task.delay(0.35, function()
            if dialog.Instance and dialog.Instance.Parent then
                dialog:Close()
            end
        end)
    end)
    return dialog
end

function Window:SetProfileCallback(callback)
    assert(callback == nil or type(callback) == "function", "Profile callback must be a function or nil")
    self._profileCallback = callback
    return self
end

function Window:SetLicenseExtensionCallback(callback)
    assert(callback == nil or type(callback) == "function", "License extension callback must be a function or nil")
    self._licenseExtensionCallback = callback
    if self.LicenseExtensionButton then
        self.LicenseExtensionButton.Visible = callback ~= nil
    end
    self:_updateHeaderActionLayout()
    return self
end

function Window:_updateHeaderActionLayout()
    local actions = {
        self.CloseButton,
        self.MinimizeButton,
        self.SettingsButton,
        self.KeybindsButton,
        self.LicenseExtensionButton,
    }
    local right = -12
    local visibleCount = 0
    for _, button in ipairs(actions) do
        if button then
            button.Visible = button.Visible ~= false
            if button.Visible then
                button.Position = UDim2.new(1, right, 0.5, 0)
                right = right - 38
                visibleCount = visibleCount + 1
            end
        end
    end
    local reserved = math.max(118, visibleCount * 38 + 18)
    self._headerTitleWidth = -reserved
    if self.HeaderTitle and not self._minimized then
        self.HeaderTitle.Size = UDim2.new(1, self._headerTitleWidth, 0, 21)
    end
    if self.HeaderSubtitle and not self._minimized then
        self.HeaderSubtitle.Size = UDim2.new(1, self._headerTitleWidth, 0, 16)
    end
    return self
end

function Window:_captureFont(object)
    if not object or not object.Parent or not isTextObject(object) then
        return
    end
    if object:GetAttribute("MytrahFontLocked") == true then
        return
    end

    local weight = object:GetAttribute("MytrahFontWeight")
    if weight ~= "Semibold" and weight ~= "Regular" then
        weight = object.Font == SEMIBOLD_FONT and "Semibold" or "Regular"
        object:SetAttribute("MytrahFontWeight", weight)
    end
    object.Font = weight == "Semibold" and self.Fonts.Semibold or self.Fonts.Regular
end

function Window:_updateFont()
    if not self.ScreenGui then
        return
    end
    for _, object in ipairs(self.ScreenGui:GetDescendants()) do
        self:_captureFont(object)
    end
end

function Window:SetFont(font)
    local preset, name = resolveFont(font)
    assert(preset, "Unknown Mytrah font: " .. tostring(font))
    self.Fonts = preset
    self.FontName = name
    self:_updateFont()
    if not self._loadingConfig then
        self:_queueConfigSave()
    end
    return self
end

function Window:GetFont()
    return self.FontName
end

function Window:SetProfile(options)
    options = options or {}
    local profile = self.Profile
    if not profile then
        return self
    end

    if options.Name ~= nil then
        profile.Name.Text = tostring(options.Name)
    end
    if options.Handle ~= nil then
        profile.Handle.Text = tostring(options.Handle)
    end
    if options.Badge ~= nil then
        profile.Badge.Text = tostring(options.Badge)
    end
    if options.StatusColor ~= nil then
        profile.Status.BackgroundColor3 = options.StatusColor
    end

    local userId = tonumber(options.AvatarUserId)
    local image = options.Avatar
    if not image and userId and userId > 0 then
        image = string.format("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150", userId)
    end
    if type(image) == "string" and image ~= "" then
        profile.Avatar.Image = image
        profile.Avatar.ImageTransparency = 0
        profile.Placeholder.ImageTransparency = 1
    end

    if userId and userId > 0 then
        task.spawn(function()
            local success, thumbnail = pcall(function()
                return Players:GetUserThumbnailAsync(
                    userId,
                    Enum.ThumbnailType.HeadShot,
                    Enum.ThumbnailSize.Size150x150
                )
            end)
            if success and type(thumbnail) == "string" and profile.Avatar.Parent then
                profile.Avatar.Image = thumbnail
                profile.Avatar.ImageTransparency = 0
                profile.Placeholder.ImageTransparency = 1
            end
        end)
    end
    return self
end

function Window:_captureTextSize(object)
    if not object or not object.Parent or not isTextObject(object) then
        return
    end

    local baseSize = object:GetAttribute("MytrahBaseTextSize")
    if type(baseSize) ~= "number" or baseSize <= 0 then
        baseSize = object.TextSize
        object:SetAttribute("MytrahBaseTextSize", baseSize)
    end

    local scale = self._appliedTextScale or 1
    object.TextSize = math.max(8, math.floor(baseSize * scale + 0.5))
end

function Window:_updateTextScale()
    if not self.ScreenGui then
        return
    end

    local ratio = math.min(
        self._windowSize.X / math.max(self._baseWindowSize.X, 1),
        self._windowSize.Y / math.max(self._baseWindowSize.Y, 1)
    )
    local scale = self._textScaleOverride
        or (self.AutoTextScale and math.clamp(ratio, 0.92, 1.08) or 1)
    self._appliedTextScale = scale

    for _, object in ipairs(self.ScreenGui:GetDescendants()) do
        self:_captureTextSize(object)
    end
end

function Window:_clampWindowSize(value)
    return clampWindowSize(value, self._minWindowSize, self._maxWindowSize)
end

function Window:SetSize(value, animated)
    local nextSize = self:_clampWindowSize(normalizeWindowSize(value))
    self._windowSize = nextSize

    if self.Main and self.Main.Parent and not self._minimized then
        local target = UDim2.fromOffset(nextSize.X, nextSize.Y)
        if animated == false then
            self.Main.Size = target
        else
            tween(self.Main, { Size = target }, TWEEN_NORMAL)
        end
    end

    self:_updateScale()
    return self
end

function Window:SetTextScale(value)
    if value == nil or value == "auto" then
        self._textScaleOverride = nil
    else
        local numeric = tonumber(value)
        assert(numeric, "Text scale must be a number or 'auto'")
        self._textScaleOverride = math.clamp(numeric, 0.8, 1.15)
    end
    self:_updateTextScale()
    return self
end

function Window:SetAutoTextScale(enabled)
    self.AutoTextScale = enabled ~= false
    self:_updateTextScale()
    return self
end

function Window:GetTextScale()
    return self._appliedTextScale or 1
end

function Window:_playEntrance()
    if not self.Main or not self.Main.Parent then
        return
    end

    local target = self.Main.Position
    self.Main.Position = offsetPosition(target, 0, 10)
    tween(self.Main, { Position = target }, TWEEN_POP)
end

function Window:GetScale()
    return self._currentScale or 1
end

function Window:_updateScale()
    local camera = workspace.CurrentCamera
    if not camera or not self.Main then
        return
    end

    local viewport = camera.ViewportSize
    local target = self._minimized and Vector2.new(320, 58) or self._windowSize
    local available = Vector2.new(math.max(viewport.X - 24, 1), math.max(viewport.Y - 24, 1))
    local scale = math.min(1, available.X / target.X, available.Y / target.Y)
    local mobile = isMobileViewport()
    if mobile then
        scale = scale * 0.85
    end
    self._currentScale = math.max(mobile and 0.32 or 0.4, scale)
    self.Scale.Scale = self._currentScale
    self:_updateTextScale()
end

function Window:_updateMobileKeybinds()
    local mobile = isMobileViewport()
    self._mobileDevice = mobile
    if self.MobileKeybindsGui then
        self.MobileKeybindsGui.Enabled = mobile
    end
end

function Window:Toggle(force)
    if self._destroyed or self._destroying then
        return self
    end

    self:_closePopup()
    local enabled = type(force) == "boolean" and force or not self.ScreenGui.Enabled
    self._toggleToken = (self._toggleToken or 0) + 1
    local token = self._toggleToken

    if enabled then
        self.ScreenGui.Enabled = true
        if self.TransitionGroup then
            self.TransitionGroup.GroupTransparency = 1
        end
        if self.EntranceScale then
            self.EntranceScale.Scale = 0.975
        end
        tween(self.TransitionGroup, { GroupTransparency = 0 }, TWEEN_NORMAL)
        tween(self.EntranceScale, { Scale = 1 }, TWEEN_POP)
        self:_playEntrance()
    else
        tween(self.TransitionGroup, { GroupTransparency = 1 }, TWEEN_CLOSE)
        tween(self.EntranceScale, { Scale = 0.975 }, TWEEN_CLOSE)
        task.delay(TWEEN_CLOSE.Time, function()
            if token == self._toggleToken and not self._destroyed and self.ScreenGui then
                self.ScreenGui.Enabled = false
            end
        end)
    end
    self:_updateMobileKeybinds()
    return self
end

function Window:SetVisible(visible)
    return self:Toggle(visible == true)
end

function Window:IsVisible()
    return not self._destroyed and self.ScreenGui and self.ScreenGui.Enabled == true
end

    function Window:Minimize(force)
    if self._destroyed or self._destroying then
        return self
    end

    local minimized = type(force) == "boolean" and force or not self._minimized
    if minimized == self._minimized then
        return self
    end

    self._minimized = minimized
    self:_closePopup()
    local headerTitleWidth = self._headerTitleWidth or -164

    if minimized then
        self._sizeAnimating = true
        self.HeaderTitle.Text = self.Title
        self.HeaderSubtitle.Visible = false
        self.MinimizeIcon.Image = resolveIcon("maximize")
        tween(self.HeaderTitle, {
            Position = UDim2.fromOffset(66, 18),
            Size = UDim2.new(1, headerTitleWidth, 0, 21),
        }, TWEEN_POP)
        tween(self.Header, {
            Position = UDim2.fromOffset(0, 0),
            Size = UDim2.new(1, 0, 1, 0),
        }, TWEEN_POP)
        local animation = tween(self.Main, { Size = UDim2.fromOffset(320, 58) }, TWEEN_POP)
        if self.BodyGroup then
            self.BodyGroup.GroupTransparency = 1
            self.BodyGroup.Visible = false
        end
        if animation then
            animation.Completed:Once(function()
                self._sizeAnimating = false
            end)
        else
            self._sizeAnimating = false
        end
    else
        self._sizeAnimating = true
        if self.BodyGroup then
            self.BodyGroup.Visible = true
            self.BodyGroup.GroupTransparency = 1
        end
        self.HeaderSubtitle.Visible = true
        self.MinimizeIcon.Image = resolveIcon("minimize")
        tween(self.HeaderTitle, {
            Position = UDim2.fromOffset(66, 8),
            Size = UDim2.new(1, headerTitleWidth, 0, 21),
        }, TWEEN_POP)
        tween(self.Header, {
            Position = UDim2.fromOffset(SIDEBAR_WIDTH, 0),
            Size = UDim2.new(1, -SIDEBAR_WIDTH, 0, HEADER_HEIGHT),
        }, TWEEN_POP)
        local animation = tween(self.Main,
            { Size = UDim2.fromOffset(self._windowSize.X, self._windowSize.Y) },
            TWEEN_POP
        )
        if self.BodyGroup then
            if animation then
                animation.Completed:Once(function()
                    self._sizeAnimating = false
                    if not self._minimized and self.BodyGroup.Parent then
                        tween(self.BodyGroup, { GroupTransparency = 0 }, TWEEN_NORMAL)
                    end
                end)
            else
                self._sizeAnimating = false
                tween(self.BodyGroup, { GroupTransparency = 0 }, TWEEN_NORMAL)
            end
        end
        if self.SelectedTab then
            self.HeaderTitle.Text = self.SelectedTab.Title
            self.HeaderSubtitle.Text = self.SelectedTab.Description
        end
    end

    self:_updateScale()
    return self
end

function Window:_destroyNow()
    if self._destroyed then
        return
    end

    if self._autoSave then
        self:SaveConfig()
    end
    self._destroyed = true
    self:_closePopup()

    for _, connection in ipairs(self._connections) do
        connection:Disconnect()
    end

    for flag, option in pairs(self.Options) do
        if Mytrah.Options[flag] == option then
            Mytrah.Options[flag] = nil
        end
    end

    if self.ScreenGui then
        self.ScreenGui:Destroy()
    end
    if self.MobileKeybindsGui then
        self.MobileKeybindsGui:Destroy()
    end
    if self.KeybindScreenGui then
        self.KeybindScreenGui:Destroy()
    end

    if Mytrah._activeWindow == self then
        Mytrah._activeWindow = nil
    end
end

function Window:Destroy(animated)
    if self._destroyed or self._destroying then
        return
    end

    if animated == false or not self.Main or not self.Main.Parent then
        self:_destroyNow()
        return
    end

    self._destroying = true
    self:_closePopup()
    local animation = tween(self.EntranceScale, { Scale = 0.975 }, TWEEN_CLOSE)
    tween(self.TransitionGroup, { GroupTransparency = 1 }, TWEEN_CLOSE)

    if animation then
        animation.Completed:Once(function()
            self:_destroyNow()
        end)
    else
        self:_destroyNow()
    end
end

function Window:ConfirmClose()
    if self._destroyed or self._destroying then
        return nil
    end
    if self._closeDialog then
        return self._closeDialog
    end

    local handle
    handle = self:Dialog({
        Title = "Close Mytrah?",
        Subtitle = "Permanent action",
        Content = "Closing now unloads the library and removes all of its controls. You will need to run the script again to open it.",
        Type = "Warning",
        Icon = "alert-circle",
        Width = 360,
        Height = 216,
        Buttons = {
            { Title = "Keep it open", Width = 118, Primary = false },
            {
                Title = "Close library",
                Width = 118,
                Primary = true,
                Callback = function()
                    self._closeDialog = nil
                    self:Destroy()
                end,
            },
        },
    })
    self._closeDialog = handle
    return handle
end

function Window:_refreshNavigation()
    local query = string.lower(trim(self.SearchBox.Text))
    local categoryMatches = {}
    local firstMatchTab
    local firstMatchSubTab
    local matchCount = 0

    for _, tab in ipairs(self.Tabs) do
        local matches = query == ""
        for _, section in ipairs(tab.Sections) do
            local sectionMatches = query == ""
            for _, control in ipairs(section.Controls) do
                local controlMatches = query == ""
                    or string.find(control._searchText or "", query, 1, true) ~= nil
                control._searchMatch = controlMatches
                if control.Instance then
                    local visible = control._visible ~= false and controlMatches
                    control.Instance:SetAttribute("MytrahBaseVisible", visible)
                    control.Instance.Visible = visible
                end
                if controlMatches and query ~= "" then
                    matchCount = matchCount + 1
                    if not firstMatchTab then
                        firstMatchTab = tab
                        firstMatchSubTab = control.SubTab
                    end
                end
                sectionMatches = sectionMatches or controlMatches
            end

            if query == "" then
                section.Frame.Visible = true
            else
                section.Frame.Visible = sectionMatches
                if sectionMatches and section._collapsed then
                    section:SetExpanded(true)
                end
            end
            matches = matches or sectionMatches
        end

        tab.NavButton.Visible = matches
        if matches and tab.Category then
            categoryMatches[tab.Category] = true
            firstMatchTab = firstMatchTab or tab
        end

        local active = self.SelectedTab == tab
        local wasActive = tab.ActiveBar.Visible
        tab.ActiveBar.Visible = active
        if active and not wasActive then
            tab.ActiveBar.Size = UDim2.fromOffset(3, 0)
            tween(tab.ActiveBar, { Size = UDim2.fromOffset(3, 21) }, TWEEN_FAST)
        elseif not active then
            tab.ActiveBar.Size = UDim2.fromOffset(3, 21)
        end
        tab.NavButton.BackgroundTransparency = active and 0.05 or 1
        tab.NavButton.BackgroundColor3 = active and mix(self.Theme.AccentDark, self.Theme.Sidebar, 0.2)
            or self.Theme.Sidebar
        tab.NavIcon.ImageColor3 = active and self.Theme.Accent or self.Theme.Muted
        tab.NavTitle.TextColor3 = active and self.Theme.Text or self.Theme.Muted
        if tab._refreshSubtabs then
            tab:_refreshSubtabs()
        end

    end

    for _, category in ipairs(self.Categories) do
        category.Label.Visible = query == "" or categoryMatches[category] == true
        if category.TopButton then
            local active = self.SelectedTab and self.SelectedTab.Category == category
            category.TopButton.Visible = query == "" or categoryMatches[category] == true
            category.TopButton.BackgroundTransparency = active and 0.08 or 1
            category.TopButton.BackgroundColor3 = active
                and mix(self.Theme.AccentDark, self.Theme.Topbar, 0.28)
                or self.Theme.Topbar
            category.TopTitle.TextColor3 = active and self.Theme.Text or self.Theme.Muted
            category.TopLine.Visible = active
        end
    end

    if query ~= "" and firstMatchTab then
        if firstMatchSubTab then
            firstMatchTab:SelectSubTab(firstMatchSubTab, true)
        end
        if self.SelectedTab ~= firstMatchTab then
            self:SelectTab(firstMatchTab)
        end
    end
    if self.SearchEmpty then
        self.SearchEmpty.Visible = query ~= "" and matchCount == 0
    end
    self:_refreshColumnViewports()
end

function Window:SelectTab(tab)
    if type(tab) == "string" then
        for _, candidate in ipairs(self.Tabs) do
            if candidate.Title == tab or candidate.Id == tab then
                tab = candidate
                break
            end
        end
    end

    if type(tab) ~= "table" or not tab.Page then
        return self
    end

    self:_closePopup()
    self.SelectedTab = tab

    for _, candidate in ipairs(self.Tabs) do
        local selected = candidate == tab
        candidate.Page.Visible = selected
        if selected then
            candidate.Page.Position = UDim2.fromOffset(8, 0)
            if candidate.PageScale then
                candidate.PageScale.Scale = 0.985
                tween(candidate.PageScale, { Scale = 1 }, TWEEN_POP)
            end
            tween(candidate.Page, { Position = UDim2.fromOffset(0, 0) }, TWEEN_POP)
        end
    end

    if tab._refreshSubtabs then
        tab:_refreshSubtabs()
    end

    self.HeaderTitle.Text = tab.Title
    self.HeaderSubtitle.Text = tab.Description
    self.HeaderIcon.Image = resolveIcon(tab.Icon)
    self.HeaderIcon.ImageTransparency = tab.Icon and 0 or 1
    self:_refreshNavigation()
    task.delay(0.05, function()
        if not self._destroyed and not self._destroying and self.SelectedTab == tab then
            self:_updateResponsiveLayout()
            self:_refreshColumnViewports()
        end
    end)
    return self
end

function Mytrah:CreateWindow(options)
    options = options or {}

    local requestedTheme = options.Theme or "Obsidian"
    local sourceTheme, themeName = resolveTheme(requestedTheme)
    assert(sourceTheme, "Unknown Mytrah theme: " .. tostring(requestedTheme))

    local theme = {}
    for key, value in pairs(self.Themes.Obsidian) do
        theme[key] = sourceTheme[key] or value
    end

    local fontPreset, fontName = resolveFont(options.Font or "Gotham")
    assert(fontPreset, "Unknown Mytrah font: " .. tostring(options.Font))

    local initialSize = normalizeWindowSize(options.Size)
    local minimumSize = normalizeWindowSize(options.MinSize or Vector2.new(680, 420))
    local maximumSize = normalizeWindowSize(options.MaxSize or Vector2.new(1200, 800))
    maximumSize = Vector2.new(
        math.max(maximumSize.X, minimumSize.X),
        math.max(maximumSize.Y, minimumSize.Y)
    )
    initialSize = clampWindowSize(initialSize, minimumSize, maximumSize)

    local window = setmetatable({
        Title = options.Title or "Mytrah",
        Subtitle = options.Subtitle or options.SubTitle or "Interface Library",
        Theme = theme,
        ThemeName = themeName,
        Fonts = fontPreset,
        FontName = fontName,
        Tabs = {},
        Categories = {},
        Options = {},
        _connections = {},
        _themeBindings = {},
        _themeCallbacks = {},
        _columnRefreshers = {},
        _destroyed = false,
        _minimized = false,
        _windowSize = initialSize,
        _baseWindowSize = initialSize,
        _minWindowSize = minimumSize,
        _maxWindowSize = maximumSize,
        _minimizeKey = options.MinimizeKey,
        _toggleKey = options.ToggleKey or options.MinimizeKey or Enum.KeyCode.RightControl,
        ToggleKey = options.ToggleKey or options.MinimizeKey or Enum.KeyCode.RightControl,
        _layoutOrder = 0,
        _notificationOrder = 0,
        AutoTextScale = options.AutoTextScale ~= false,
        _textScaleOverride = tonumber(options.TextScale),
        _autoSave = options.AutoSave ~= false,
        _autoLoad = options.AutoLoad ~= false,
        _settingsCallback = options.SettingsCallback or options.OnSettings,
        _profileCallback = options.ProfileCallback or options.OnProfile,
        _licenseExtensionCallback = options.LicenseExtensionCallback or options.OnLicenseExtension,
    }, Window)
    window:SetToggleKey(window._toggleKey)

    local guiParent = getGuiParent()
    if self._activeWindow and not self._activeWindow._destroyed then
        self._activeWindow:Destroy(false)
    end
    local previous = guiParent and guiParent:FindFirstChild("MytrahUI")
    if previous then
        previous:Destroy()
    end
    local previousKeybinds = guiParent and guiParent:FindFirstChild("MytrahKeybinds")
    if previousKeybinds then
        previousKeybinds:Destroy()
    end

    local screenGui = create("ScreenGui", {
        Name = "MytrahUI",
        DisplayOrder = options.DisplayOrder or 850,
        IgnoreGuiInset = true,
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
    })

    if syn and type(syn.protect_gui) == "function" then
        pcall(syn.protect_gui, screenGui)
    end
    screenGui.Parent = guiParent
    window.ScreenGui = screenGui

    local staleMobileToggle = guiParent and guiParent:FindFirstChild("MytrahMobileToggle")
    if staleMobileToggle then
        staleMobileToggle:Destroy()
    end
    local previousMobileKeybinds = guiParent and guiParent:FindFirstChild("MytrahMobileKeybinds")
    if previousMobileKeybinds then
        previousMobileKeybinds:Destroy()
    end
    window:_connect(screenGui.DescendantAdded, function(object)
        window:_captureTextSize(object)
        window:_captureFont(object)
    end)

    local transitionGroup = create("CanvasGroup", {
        Name = "Transition",
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        GroupTransparency = 1,
        Parent = screenGui,
    })
    window.TransitionGroup = transitionGroup

    local main = create("Frame", {
        Name = "Window",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(window._windowSize.X, window._windowSize.Y),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = transitionGroup,
    })
    addCorner(main, WINDOW_RADIUS)
    main.ClipsDescendants = true
    local mainStroke = addStroke(main, theme.Border, 0.35, 1)
    window:_paint(main, "BackgroundColor3", "Background")
    window:_paint(mainStroke, "Color", "Border")
    window.Main = main
    window.MainStroke = mainStroke
    window:_connect(main.MouseEnter, function()
        tween(mainStroke, { Color = window.Theme.Accent, Transparency = 0.14 }, TWEEN_FAST)
    end)
    window:_connect(main.MouseLeave, function()
        tween(mainStroke, { Color = window.Theme.Border, Transparency = 0.35 }, TWEEN_FAST)
    end)

    local bodyGroup = create("CanvasGroup", {
        Name = "BodyGroup",
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        GroupTransparency = 0,
        ClipsDescendants = true,
        Parent = main,
    })
    window.BodyGroup = bodyGroup

    local scale = create("UIScale", {
        Scale = 1,
        Parent = main,
    })
    window.Scale = scale

    local entranceScale = create("UIScale", {
        Scale = 0.975,
        Parent = main,
    })
    window.EntranceScale = entranceScale

    local rightSurface = create("Frame", {
        Name = "Surface",
        Position = UDim2.fromOffset(SIDEBAR_WIDTH - WINDOW_RADIUS, 0),
        Size = UDim2.new(1, -SIDEBAR_WIDTH + WINDOW_RADIUS, 1, 0),
        BorderSizePixel = 0,
        Parent = bodyGroup,
    })
    addCorner(rightSurface, WINDOW_RADIUS)
    window:_paint(rightSurface, "BackgroundColor3", "Background")
    window.RightSurface = rightSurface

    local sidebar = create("Frame", {
        Name = "Sidebar",
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.new(0, SIDEBAR_WIDTH, 1, 0),
        BorderSizePixel = 0,
        Parent = bodyGroup,
    })
    addCorner(sidebar, WINDOW_RADIUS)
    window:_paint(sidebar, "BackgroundColor3", "Sidebar")
    window.Sidebar = sidebar

    local sidebarBorder = create("Frame", {
        Name = "Border",
        Position = UDim2.new(1, -1, 0, 0),
        Size = UDim2.new(0, 1, 1, 0),
        BackgroundTransparency = 0.55,
        BorderSizePixel = 0,
        Parent = sidebar,
    })
    window:_paint(sidebarBorder, "BackgroundColor3", "Border")

    local brand = create("Frame", {
        Name = "Brand",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(16, 12),
        Size = UDim2.new(1, -32, 0, 66),
        Parent = sidebar,
    })

    local logoBack = create("Frame", {
        Name = "LogoBack",
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, 0),
        Size = UDim2.fromOffset(38, 38),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = brand,
    })
    addCorner(logoBack, 11)
    window:_paint(logoBack, "BackgroundColor3", "AccentDark")

    local logo = window:_makeIcon(logoBack, options.Icon or "diamond", 24, "Accent")
    logo.AnchorPoint = Vector2.new(0.5, 0.5)
    logo.Position = UDim2.fromScale(0.5, 0.5)

    local brandTitle = create("TextLabel", {
        Name = "Title",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(0, 39),
        Size = UDim2.new(1, 0, 0, 18),
        Font = SEMIBOLD_FONT,
        Text = window.Title,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = brand,
    })
    window:_paint(brandTitle, "TextColor3", "Accent")

    local brandSubtitle = create("TextLabel", {
        Name = "Subtitle",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(0, 56),
        Size = UDim2.new(1, 0, 0, 12),
        Font = DEFAULT_FONT,
        Text = window.Subtitle,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = brand,
    })
    window:_paint(brandSubtitle, "TextColor3", "Muted")

    local searchBack = create("Frame", {
        Name = "Search",
        Position = UDim2.fromOffset(16, 88),
        Size = UDim2.new(1, -32, 0, 34),
        BorderSizePixel = 0,
        Parent = sidebar,
    })
    addCorner(searchBack, 9)
    local searchStroke = addStroke(searchBack, theme.Border, 0.35, 1)
    window:_paint(searchBack, "BackgroundColor3", "Control")
    window:_paint(searchStroke, "Color", "Border")

    local searchIcon = window:_makeIcon(searchBack, "search", 15, "Muted")
    searchIcon.AnchorPoint = Vector2.new(0, 0.5)
    searchIcon.Position = UDim2.new(0, 10, 0.5, 0)

    local searchBox = create("TextBox", {
        Name = "Input",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(35, 0),
        Size = UDim2.new(1, -43, 1, 0),
        ClearTextOnFocus = false,
        Font = DEFAULT_FONT,
        PlaceholderText = "Search controls",
        Text = "",
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = searchBack,
    })
    window:_paint(searchBox, "TextColor3", "Text")
    window:_paint(searchBox, "PlaceholderColor3", "Muted")
    window.SearchBox = searchBox

    local clearSearch = create("ImageButton", {
        Name = "Clear",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -8, 0.5, 0),
        Size = UDim2.fromOffset(20, 20),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutoButtonColor = false,
        ImageTransparency = 1,
        Visible = false,
        Parent = searchBack,
    })
    addCorner(clearSearch, 6)
    local clearSearchIcon = window:_makeIcon(clearSearch, "x", 12, "Muted")
    clearSearchIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    clearSearchIcon.Position = UDim2.fromScale(0.5, 0.5)
    window:_connect(clearSearch.Activated, function()
        searchBox.Text = ""
        searchBox:CaptureFocus()
    end)
    window:_connect(clearSearch.MouseEnter, function()
        tween(clearSearch, { BackgroundTransparency = 0.15, BackgroundColor3 = window.Theme.ControlHover }, TWEEN_FAST)
        tween(clearSearchIcon, { ImageColor3 = window.Theme.Text }, TWEEN_FAST)
    end)
    window:_connect(clearSearch.MouseLeave, function()
        tween(clearSearch, { BackgroundTransparency = 1 }, TWEEN_FAST)
        tween(clearSearchIcon, { ImageColor3 = window.Theme.Muted }, TWEEN_FAST)
    end)
    window:_connect(searchBox.Focused, function()
        tween(searchStroke, { Color = window.Theme.Accent, Transparency = 0 }, TWEEN_FAST)
    end)
    window:_connect(searchBox.FocusLost, function()
        tween(searchStroke, { Color = window.Theme.Border, Transparency = 0.35 }, TWEEN_FAST)
    end)

    local nav = create("ScrollingFrame", {
        Name = "Navigation",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(13, 130),
        Size = UDim2.new(1, -26, 1, -188),
        BorderSizePixel = 0,
        CanvasSize = UDim2.new(),
        ScrollBarImageTransparency = 1,
        ScrollBarThickness = 0,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        Parent = sidebar,
    })
    window:_paint(nav, "ScrollBarImageColor3", "Accent")
    window.Navigation = nav

    local navLayout = create("UIListLayout", {
        Padding = UDim.new(0, 5),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = nav,
    })
    addPadding(nav, 0, 3, 0, 5)
    window:_connect(navLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
        nav.CanvasSize = UDim2.fromOffset(0, navLayout.AbsoluteContentSize.Y + 8)
    end)

    local footer = create("Frame", {
        Name = "Footer",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 12, 1, -54),
        Size = UDim2.new(1, -24, 0, 44),
        Parent = sidebar,
    })

    local profileCard = create("TextButton", {
        Name = "ProfileCard",
        Position = UDim2.fromScale(0, 0),
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 0.32,
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Text = "",
        ZIndex = 2,
        Parent = footer,
    })
    addCorner(profileCard, 8)
    local profileCardStroke = addStroke(profileCard, self.Themes.Obsidian.Border, 0.55, 1)
    window:_paint(profileCard, "BackgroundColor3", "Control")
    window:_paint(profileCardStroke, "Color", "Border")

    local profileBack = create("Frame", {
        Name = "ProfileBack",
        Position = UDim2.fromOffset(7, 7),
        Size = UDim2.fromOffset(30, 30),
        BorderSizePixel = 0,
        ZIndex = 3,
        Parent = profileCard,
    })
    addCorner(profileBack, 15)
    local profileStroke = addStroke(profileBack, self.Themes.Obsidian.Border, 0.2, 1)
    window:_paint(profileBack, "BackgroundColor3", "Control")
    window:_paint(profileStroke, "Color", "Border")

    local player = Players.LocalPlayer
    local avatarUserId = player and tonumber(player.UserId) or 0
    local initialAvatar = avatarUserId > 0
        and string.format("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150", avatarUserId)
        or ""

    local profilePlaceholder = window:_makeIcon(profileBack, "user", 13, "Muted")
    profilePlaceholder.AnchorPoint = Vector2.new(0.5, 0.5)
    profilePlaceholder.Position = UDim2.fromScale(0.5, 0.5)
    profilePlaceholder.ZIndex = 3
    profilePlaceholder.ImageTransparency = 1

    local avatar = create("ImageLabel", {
        Name = "Avatar",
        BackgroundTransparency = 1,
        Image = initialAvatar,
        ImageTransparency = initialAvatar ~= "" and 0 or 1,
        Size = UDim2.fromScale(1, 1),
        ZIndex = 4,
        Parent = profileBack,
    })
    addCorner(avatar, 15)

    local displayName = player and (player.DisplayName ~= "" and player.DisplayName or player.Name) or "Player"
    local username = player and player.Name or "Unknown"
    local executorName = getExecutorName()

    local profileName = create("TextLabel", {
        Name = "ProfileName",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(44, 7),
        Size = UDim2.new(1, -86, 0, 14),
        Font = SEMIBOLD_FONT,
        Text = tostring(displayName),
        TextSize = 10,
        TextTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        ZIndex = 3,
        Parent = profileCard,
    })
    window:_paint(profileName, "TextColor3", "Text")

    local profileHandle = create("TextLabel", {
        Name = "ProfileHandle",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(44, 22),
        Size = UDim2.new(1, -86, 0, 11),
        Font = DEFAULT_FONT,
        Text = "@" .. tostring(username),
        TextSize = 8,
        TextTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        ZIndex = 3,
        Parent = profileCard,
    })
    window:_paint(profileHandle, "TextColor3", "Muted")

    local statusRing = create("Frame", {
        Name = "StatusRing",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromOffset(34, 35),
        Size = UDim2.fromOffset(10, 10),
        BorderSizePixel = 0,
        ZIndex = 5,
        Parent = profileCard,
    })
    addCorner(statusRing, 6)
    window:_paint(statusRing, "BackgroundColor3", "Control")

    local statusDot = create("Frame", {
        Name = "Status",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(5, 5),
        BorderSizePixel = 0,
        ZIndex = 6,
        Parent = statusRing,
    })
    addCorner(statusDot, 7)
    window:_paint(statusDot, "BackgroundColor3", "Success")

    local executorLabel = create("TextLabel", {
        Name = "Executor",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(136, 8),
        Size = UDim2.fromOffset(80, 10),
        Font = SEMIBOLD_FONT,
        Text = executorName,
        TextSize = 7,
        TextTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Right,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Visible = false,
        ZIndex = 3,
        Parent = profileCard,
    })
    window:_paint(executorLabel, "TextColor3", "Accent")

    local footerText = create("TextLabel", {
        Name = "Version",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(136, 19),
        Size = UDim2.fromOffset(80, 10),
        Font = DEFAULT_FONT,
        Text = "v" .. self.Version,
        TextSize = 7,
        TextTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Right,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Visible = false,
        ZIndex = 3,
        Parent = profileCard,
    })
    window:_paint(footerText, "TextColor3", "Muted")

    local profileToggle = create("TextButton", {
        Name = "VisibilityToggle",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -8, 0.5, 0),
        Size = UDim2.fromOffset(28, 28),
        AutoButtonColor = false,
        BorderSizePixel = 0,
        Text = "",
        ZIndex = 5,
        Parent = footer,
    })
    addCorner(profileToggle, 8)
    local profileToggleStroke = addStroke(profileToggle, self.Themes.Obsidian.Border, 0.22, 1)
    window:_paint(profileToggle, "BackgroundColor3", "AccentDark")
    window:_paint(profileToggleStroke, "Color", "Border")
    local profileToggleIcon = window:_makeIcon(profileToggle, "eye", 12, "Accent")
    profileToggleIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    profileToggleIcon.Position = UDim2.fromScale(0.5, 0.5)
    window:_attachTooltip(profileToggle, "Change show / hide key")
    window:_connect(profileToggle.MouseEnter, function()
        tween(profileToggle, { BackgroundColor3 = window.Theme.Accent, BackgroundTransparency = 0.04 }, TWEEN_FAST)
        tween(profileToggleIcon, { ImageColor3 = window.Theme.AccentText }, TWEEN_FAST)
    end)
    window:_connect(profileToggle.MouseLeave, function()
        tween(profileToggle, { BackgroundColor3 = window.Theme.AccentDark, BackgroundTransparency = 0 }, TWEEN_FAST)
        tween(profileToggleIcon, { ImageColor3 = window.Theme.Accent }, TWEEN_FAST)
    end)
    window:_connect(profileToggle.Activated, function()
        window:PromptToggleKey()
    end)
    window.VisibilityToggle = profileToggle
    window:SetProfile(options.Profile or {
        Name = displayName,
        Handle = "@" .. tostring(username),
        Badge = executorName,
        AvatarUserId = avatarUserId,
    })

    window.Profile = {
        Avatar = avatar,
        Placeholder = profilePlaceholder,
        Name = profileName,
        Handle = profileHandle,
        Badge = executorLabel,
        Version = footerText,
        Status = statusDot,
    }

    window:_attachTooltip(profileCard, options.Footer
        or ("Executor: " .. executorName .. " | Mytrah v" .. self.Version))
    window:_connect(profileCard.MouseEnter, function()
        tween(profileCard, {
            BackgroundColor3 = window.Theme.ControlHover,
            BackgroundTransparency = 0.08,
        }, TWEEN_FAST)
        tween(profileCardStroke, { Color = window.Theme.Accent, Transparency = 0.08 }, TWEEN_FAST)
    end)
    window:_connect(profileCard.MouseLeave, function()
        tween(profileCard, {
            BackgroundColor3 = window.Theme.Control,
            BackgroundTransparency = 0.18,
        }, TWEEN_FAST)
        tween(profileCardStroke, { Color = window.Theme.Border, Transparency = 0.48 }, TWEEN_FAST)
    end)
    window:_connect(profileCard.Activated, function()
        if type(window._profileCallback) == "function" then
            safeCallback(window._profileCallback, window)
            return
        end
        window:Dialog({
            Title = tostring(displayName),
            Subtitle = "@" .. tostring(username),
            Type = "Info",
            Icon = "user",
            AvatarUserId = player and player.UserId or 0,
            Width = 360,
            Groups = {
                {
                    Title = "ROBLOX PROFILE",
                    Details = {
                        { Label = "Username", Value = "@" .. tostring(username) },
                        { Label = "Display name", Value = tostring(displayName) },
                        { Label = "User ID", Value = tostring(player and player.UserId or 0) },
                    },
                },
                {
                    Title = "RUNTIME",
                    Details = {
                        { Label = "Executor", Value = executorName },
                        { Label = "Library", Value = "Mytrah v" .. self.Version },
                        { Label = "Font", Value = window:GetFont() },
                    },
                },
            },
            CloseOnBackdrop = true,
            Buttons = {
                { Title = "Close", Primary = true },
            },
        })
    end)

    local statusPulse = TweenService:Create(
        statusDot,
        TweenInfo.new(1.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
        { BackgroundTransparency = 0.42 }
    )
    statusPulse:Play()

    task.defer(function()
        if not profileCard.Parent then
            return
        end
        tween(profileCard, { BackgroundTransparency = 0.18 }, TWEEN_NORMAL)
        tween(profileCardStroke, { Transparency = 0.48 }, TWEEN_NORMAL)
        tween(profilePlaceholder, { ImageTransparency = avatar.Image ~= "" and 1 or 0 }, TWEEN_NORMAL)
        tween(profileName, { TextTransparency = 0 }, TWEEN_NORMAL)
        tween(profileHandle, { TextTransparency = 0 }, TWEEN_NORMAL)
        tween(executorLabel, { TextTransparency = 0 }, TWEEN_NORMAL)
        tween(footerText, { TextTransparency = 0 }, TWEEN_NORMAL)
    end)

    local header = create("Frame", {
        Name = "Header",
        Position = UDim2.fromOffset(SIDEBAR_WIDTH, 0),
        Size = UDim2.new(1, -SIDEBAR_WIDTH, 0, HEADER_HEIGHT),
        BorderSizePixel = 0,
        Parent = main,
    })
    addCorner(header, WINDOW_RADIUS)
    window:_paint(header, "BackgroundColor3", "Topbar")
    window.Header = header

    local headerBorder = create("Frame", {
        Position = UDim2.new(0, 0, 1, -1),
        Size = UDim2.new(1, 0, 0, 1),
        BackgroundTransparency = 0.55,
        BorderSizePixel = 0,
        Parent = header,
    })
    window:_paint(headerBorder, "BackgroundColor3", "Border")

    local headerIconBack = create("Frame", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 18, 0.5, 0),
        Size = UDim2.fromOffset(34, 34),
        BorderSizePixel = 0,
        Parent = header,
    })
    addCorner(headerIconBack, 10)
    window:_paint(headerIconBack, "BackgroundColor3", "Control")

    local headerIcon = window:_makeIcon(headerIconBack, "layout-dashboard", 17, "Accent")
    headerIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    headerIcon.Position = UDim2.fromScale(0.5, 0.5)
    window.HeaderIcon = headerIcon

    local headerTitle = create("TextLabel", {
        Name = "Title",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(66, 6),
        Size = UDim2.new(1, -202, 0, 19),
        Font = SEMIBOLD_FONT,
        Text = "Overview",
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = header,
    })
    window:_paint(headerTitle, "TextColor3", "Text")
    window.HeaderTitle = headerTitle

    local headerSubtitle = create("TextLabel", {
        Name = "Subtitle",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(66, 26),
        Size = UDim2.new(1, -202, 0, 14),
        Font = DEFAULT_FONT,
        Text = "Select a tab",
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = header,
    })
    window:_paint(headerSubtitle, "TextColor3", "Muted")
    window.HeaderSubtitle = headerSubtitle

    local function topbarButton(name, icon, offset, tooltip, backgroundKey, iconColor)
        backgroundKey = backgroundKey or "Control"
        iconColor = iconColor or (name == "Close" and "Danger" or "Muted")
        local button = create("ImageButton", {
            Name = name,
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, offset, 0.5, 0),
            Size = UDim2.fromOffset(32, 32),
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            AutoButtonColor = false,
            ImageTransparency = 1,
            Parent = header,
        })
        addCorner(button, 10)
        window:_paint(button, "BackgroundColor3", backgroundKey)

        local image = window:_makeIcon(button, icon, 15, iconColor)
        image.AnchorPoint = Vector2.new(0.5, 0.5)
        image.Position = UDim2.fromScale(0.5, 0.5)
        local buttonScale = create("UIScale", {
            Scale = 1,
            Parent = button,
        })
        window:_attachTooltip(button, tooltip)

        window:_connect(button.MouseEnter, function()
            local hoverColor = name == "Close"
                and mix(window.Theme.Danger, window.Theme.Control, 0.82)
                or window.Theme.ControlHover
            tween(button, { BackgroundColor3 = hoverColor })
            tween(image, { ImageColor3 = window.Theme.Text })
            tween(buttonScale, { Scale = 1.06 }, TWEEN_FAST)
        end)
        window:_connect(button.MouseLeave, function()
            tween(button, { BackgroundColor3 = window.Theme[backgroundKey] })
            tween(image, { ImageColor3 = window.Theme[iconColor] })
            tween(buttonScale, { Scale = 1 }, TWEEN_FAST)
        end)

        return button, image
    end

    local licenseButton, licenseIcon = topbarButton(
        "ExtendLicense", "key", -128, "Extend license", "AccentDark", "Accent"
    )
    local keybindsButton, keybindsIcon = topbarButton("Keybinds", "keyboard", -166, "Show keybinds")
    local settingsButton, settingsIcon = topbarButton("Settings", "cog", -90, "Account settings")
    local minimizeButton, minimizeIcon = topbarButton("Minimize", "minimize", -52, "Minimize")
    local closeButton, closeIcon = topbarButton("Close", "x", -14, "Close")
    licenseButton.Visible = type(window._licenseExtensionCallback) == "function"
    settingsButton.Visible = type(window._settingsCallback) == "function"
    window.LicenseExtensionButton = licenseButton
    window.LicenseExtensionIcon = licenseIcon
    window.KeybindsButton = keybindsButton
    window.KeybindsIcon = keybindsIcon
    window.SettingsButton = settingsButton
    window.CloseButton = closeButton
    window.MinimizeButton = minimizeButton
    window.SettingsIcon = settingsIcon
    window.MinimizeIcon = minimizeIcon
    window:_paint(closeIcon, "ImageColor3", "Danger")
    window:_connect(keybindsButton.Activated, function()
        window:ToggleKeybindPanel()
    end)
    window:_createKeybindPanel()
    window:_updateHeaderActionLayout()

    local content = create("Frame", {
        Name = "Content",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(SIDEBAR_WIDTH, HEADER_HEIGHT),
        Size = UDim2.new(1, -SIDEBAR_WIDTH, 1, -HEADER_HEIGHT),
        ClipsDescendants = true,
        Parent = bodyGroup,
    })
    window.Content = content

    local categoryBar = create("ScrollingFrame", {
        Name = "CategoryBar",
        BackgroundTransparency = 0,
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.new(1, 0, 0, CATEGORY_BAR_HEIGHT),
        BorderSizePixel = 0,
        CanvasSize = UDim2.new(),
        ScrollBarImageTransparency = 1,
        ScrollBarThickness = 0,
        ScrollingDirection = Enum.ScrollingDirection.X,
        Parent = content,
    })
    window:_paint(categoryBar, "BackgroundColor3", "Topbar")
    addPadding(categoryBar, 14, 14, 2, 2)
    local categoryLayout = create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Padding = UDim.new(0, 6),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = categoryBar,
    })
    window:_connect(categoryLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
        categoryBar.CanvasSize = UDim2.fromOffset(categoryLayout.AbsoluteContentSize.X + 28, 0)
    end)
    local categoryBorder = create("Frame", {
        Position = UDim2.fromOffset(0, CATEGORY_BAR_HEIGHT - 1),
        Size = UDim2.new(1, 0, 0, 1),
        BackgroundTransparency = 0.55,
        BorderSizePixel = 0,
        ZIndex = 2,
        Parent = content,
    })
    window:_paint(categoryBorder, "BackgroundColor3", "Border")
    window.CategoryBar = categoryBar
    categoryBar.Visible = false
    categoryBorder.Visible = false

    local searchEmpty = create("TextLabel", {
        Name = "SearchEmpty",
        Visible = false,
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Font = SEMIBOLD_FONT,
        Text = "No controls found",
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center,
        ZIndex = 5,
        Parent = content,
    })
    window:_paint(searchEmpty, "TextColor3", "Muted")
    window.SearchEmpty = searchEmpty

    local tooltip = create("Frame", {
        Name = "Tooltip",
        Visible = false,
        Size = UDim2.fromOffset(100, 28),
        BorderSizePixel = 0,
        ZIndex = 500,
        Parent = screenGui,
    })
    addCorner(tooltip, 8)
    local tooltipStroke = addStroke(tooltip, theme.Border, 0.18, 1)
    window:_paint(tooltip, "BackgroundColor3", "Topbar")
    window:_paint(tooltipStroke, "Color", "Border")

    local tooltipText = create("TextLabel", {
        Name = "TextLabel",
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Font = DEFAULT_FONT,
        Text = "",
        TextSize = 12,
        ZIndex = 501,
        Parent = tooltip,
    })
    window:_paint(tooltipText, "TextColor3", "Text")
    window._tooltip = tooltip

    local notifications = create("Frame", {
        Name = "Notifications",
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -16, 0, 14),
        Size = UDim2.new(0, math.clamp(tonumber(options.NotificationWidth) or 252, 190, 360), 1, -28),
        BackgroundTransparency = 1,
        ZIndex = 300,
        Parent = screenGui,
    })
    create("UIListLayout", {
        Padding = UDim.new(0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        Parent = notifications,
    })
    window.Notifications = notifications

    local resizing = false
    local resizeStart
    local resizeSize
    local resizePosition
    local resizeHorizontal
    local resizeVertical
    window.ResizeHandles = {}

    local function addResizeHandle(name, position, size, horizontal, vertical)
        local handle = create("TextButton", {
            Name = name,
            Position = position,
            Size = size,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AutoButtonColor = false,
            Text = "",
            ZIndex = 40,
            Parent = main,
        })
        addCorner(handle, 5)
        table.insert(window.ResizeHandles, handle)

        window:_connect(handle.MouseEnter, function()
            tween(handle, {
                BackgroundColor3 = window.Theme.Accent,
                BackgroundTransparency = 0.82,
            }, TWEEN_FAST)
        end)
        window:_connect(handle.MouseLeave, function()
            if not resizing then
                tween(handle, { BackgroundTransparency = 1 }, TWEEN_FAST)
            end
        end)
        window:_connect(handle.InputBegan, function(input)
            local inputType = input.UserInputType
            if inputType ~= Enum.UserInputType.MouseButton1 and inputType ~= Enum.UserInputType.Touch then
                return
            end
            if window._minimized or window._destroyed or window._destroying then
                return
            end

            resizing = true
            resizeStart = input.Position
            resizeSize = window._windowSize
            resizePosition = main.Position
            resizeHorizontal = horizontal
            resizeVertical = vertical
            tween(handle, { BackgroundTransparency = 0.68 }, TWEEN_FAST)
        end)
    end

    if options.Resizable ~= false then
        addResizeHandle("ResizeTopLeft", UDim2.fromOffset(0, 0), UDim2.fromOffset(14, 14), "left", "top")
        addResizeHandle("ResizeTop", UDim2.fromOffset(14, 0), UDim2.new(1, -28, 0, 8), nil, "top")
        addResizeHandle("ResizeTopRight", UDim2.new(1, -14, 0, 0), UDim2.fromOffset(14, 14), "right", "top")
        addResizeHandle("ResizeLeft", UDim2.fromOffset(0, 14), UDim2.new(0, 8, 1, -28), "left", nil)
        addResizeHandle("ResizeRight", UDim2.new(1, -8, 0, 14), UDim2.new(0, 8, 1, -28), "right", nil)
        addResizeHandle("ResizeBottomLeft", UDim2.new(0, 0, 1, -14), UDim2.fromOffset(14, 14), "left", "bottom")
        addResizeHandle("ResizeBottom", UDim2.new(0, 14, 1, -8), UDim2.new(1, -28, 0, 8), nil, "bottom")
        addResizeHandle("ResizeBottomRight", UDim2.new(1, -14, 1, -14), UDim2.fromOffset(14, 14), "right", "bottom")
    end

    window:_connect(UserInputService.InputChanged, function(input)
        if not resizing then
            return
        end
        local inputType = input.UserInputType
        if inputType ~= Enum.UserInputType.MouseMovement and inputType ~= Enum.UserInputType.Touch then
            return
        end

        local resizeScale = math.max(window.Scale.Scale * window.EntranceScale.Scale, 0.1)
        local delta = (input.Position - resizeStart) / resizeScale
        local requested = resizeSize
        if resizeHorizontal == "left" then
            requested = Vector2.new(resizeSize.X - delta.X, requested.Y)
        elseif resizeHorizontal == "right" then
            requested = Vector2.new(resizeSize.X + delta.X, requested.Y)
        end
        if resizeVertical == "top" then
            requested = Vector2.new(requested.X, resizeSize.Y - delta.Y)
        elseif resizeVertical == "bottom" then
            requested = Vector2.new(requested.X, resizeSize.Y + delta.Y)
        end

        local nextSize = window:_clampWindowSize(requested)
        local nextPosition = resizePosition
        if resizeHorizontal == "left" then
            nextPosition = offsetPosition(nextPosition, resizeSize.X - nextSize.X, 0)
        end
        if resizeVertical == "top" then
            nextPosition = offsetPosition(nextPosition, 0, resizeSize.Y - nextSize.Y)
        end
        window:SetSize(nextSize, false)
        main.Position = nextPosition
    end)

    window:_connect(UserInputService.InputEnded, function(input)
        local inputType = input.UserInputType
        if inputType ~= Enum.UserInputType.MouseButton1 and inputType ~= Enum.UserInputType.Touch then
            return
        end
        resizing = false
        resizeStart = nil
        for _, handle in ipairs(window.ResizeHandles) do
            tween(handle, { BackgroundTransparency = 1 }, TWEEN_FAST)
        end
    end)

    window:_connect(searchBox:GetPropertyChangedSignal("Text"), function()
        clearSearch.Visible = searchBox.Text ~= ""
        window:_refreshNavigation()
    end)

    window:_connect(minimizeButton.Activated, function()
        window:Minimize()
    end)

    window:_connect(settingsButton.Activated, function()
        if type(window._settingsCallback) == "function" then
            safeCallback(window._settingsCallback, window)
        end
    end)

    window:_connect(licenseButton.Activated, function()
        if type(window._licenseExtensionCallback) == "function" then
            safeCallback(window._licenseExtensionCallback, window)
        end
    end)

    window:_connect(closeButton.Activated, function()
        if options.DestroyOnClose == false then
            window:Toggle(false)
        else
            window:ConfirmClose()
        end
    end)
    window:_connect(UserInputService.InputBegan, function(input, gameProcessed)
        if gameProcessed or window._destroyed then
            return
        end

        if not window._capturingToggleKey and input.KeyCode == window._toggleKey then
            window:Toggle()
        end
    end)

    window:_connect(UserInputService.InputChanged, function(input)
        if tooltip.Visible and input.UserInputType == Enum.UserInputType.MouseMovement then
            local mouse = UserInputService:GetMouseLocation()
            local viewport = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1920, 1080)
            local x = math.min(mouse.X + 14, viewport.X - tooltip.AbsoluteSize.X - 8)
            local y = math.min(mouse.Y + 12, viewport.Y - tooltip.AbsoluteSize.Y - 8)
            tooltip.Position = UDim2.fromOffset(x, y)
        end
    end)

    local dragging = false
    local dragInput
    local dragStart
    local startPosition

    window:_connect(header.InputBegan, function(input)
        local inputType = input.UserInputType
        if inputType == Enum.UserInputType.MouseButton1 or inputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPosition = main.Position

            local releaseConnection
            releaseConnection = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    if releaseConnection then
                        releaseConnection:Disconnect()
                    end
                end
            end)
        end
    end)

    window:_connect(header.InputChanged, function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch
        then
            dragInput = input
        end
    end)

    window:_connect(UserInputService.InputChanged, function(input)
        if dragging and input == dragInput then
            local delta = input.Position - dragStart
            main.Position = UDim2.new(
                startPosition.X.Scale,
                startPosition.X.Offset + delta.X,
                startPosition.Y.Scale,
                startPosition.Y.Offset + delta.Y
            )
        end
    end)

    local camera = workspace.CurrentCamera
    if camera then
        window:_connect(camera:GetPropertyChangedSignal("ViewportSize"), function()
            window:_updateScale()
            window:_updateResponsiveLayout()
            window:_updateMobileKeybinds()
        end)
    end

    window:_onTheme(function()
        window:_refreshNavigation()
    end)

    window:_updateScale()
    window:_updateResponsiveLayout()
    window:_updateMobileKeybinds()
    window:_updateFont()
    self._activeWindow = window
    task.defer(function()
        if not window._destroyed and not window._destroying then
            tween(window.TransitionGroup, { GroupTransparency = 0 }, TWEEN_NORMAL)
            tween(window.EntranceScale, { Scale = 1 }, TWEEN_POP)
            window:_playEntrance()
            if window._autoLoad then
                task.delay(0.35, function()
                    if not window._destroyed and not window._destroying then
                        window:LoadConfig({ Animated = true })
                    end
                end)
            end
        end
    end)
    return window
end

function Window:Notify(options)
    options = options or {}
    local notificationType = string.lower(tostring(options.Type or "info"))
    local colorKey = notificationType == "success" and "Success"
        or notificationType == "warning" and "Warning"
        or notificationType == "error" and "Danger"
        or "Accent"
    local icon = notificationType == "success" and "check-circle"
        or notificationType == "warning" and "alert-circle"
        or notificationType == "error" and "x"
        or "info"

    local content = tostring(options.Content or options.Description or "")
    local hasContent = content ~= ""
    local contentBounds = hasContent
        and TextService:GetTextSize(content, 10, DEFAULT_FONT, Vector2.new(184, 64))
        or Vector2.new(0, 0)
    local height = math.max(38, tonumber(options.Height) or math.clamp(contentBounds.Y + (hasContent and 32 or 0), 42, 62))
    self._notificationOrder = (self._notificationOrder or 0) + 1

    local toast = create("CanvasGroup", {
        Name = "Notification",
        Size = UDim2.new(1, 0, 0, height),
        BackgroundTransparency = 0.03,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        GroupTransparency = 1,
        LayoutOrder = self._notificationOrder,
        ZIndex = 301,
        Parent = self.Notifications,
    })
    addCorner(toast, 14)
    local toastStroke = addStroke(toast, self.Theme.Border, 0.3, 1)
    self:_paint(toast, "BackgroundColor3", "Topbar")
    self:_paint(toastStroke, "Color", "Border")

    local iconBack = create("Frame", {
        Position = UDim2.fromOffset(10, math.floor((height - 24) / 2)),
        Size = UDim2.fromOffset(24, 24),
        BorderSizePixel = 0,
        ZIndex = 302,
        Parent = toast,
    })
    addCorner(iconBack, 12)
    self:_paint(iconBack, "BackgroundColor3", "Control")

    local toastIcon = newIcon(iconBack, options.Icon or icon, 14, self.Theme[colorKey])
    toastIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    toastIcon.Position = UDim2.fromScale(0.5, 0.5)
    toastIcon.ZIndex = 303
    self:_paint(toastIcon, "ImageColor3", colorKey)

    local title = create("TextLabel", {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(42, hasContent and 7 or math.floor((height - 16) / 2)),
        Size = UDim2.new(1, -70, 0, 16),
        Font = SEMIBOLD_FONT,
        Text = tostring(options.Title or "Notification"),
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        ZIndex = 302,
        Parent = toast,
    })
    self:_paint(title, "TextColor3", "Text")

    local contentLabel = create("TextLabel", {
        BackgroundTransparency = 1,
        Visible = hasContent,
        Position = UDim2.fromOffset(42, 24),
        Size = UDim2.new(1, -54, 0, math.max(14, height - 29)),
        Font = DEFAULT_FONT,
        Text = content,
        TextSize = 10,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        ZIndex = 302,
        Parent = toast,
    })
    self:_paint(contentLabel, "TextColor3", "Muted")

    local closeButton = create("ImageButton", {
        Name = "Close",
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -8, 0, 7),
        Size = UDim2.fromOffset(18, 18),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutoButtonColor = false,
        ImageTransparency = 1,
        ZIndex = 304,
        Parent = toast,
    })
    addCorner(closeButton, 7)
    local closeIcon = newIcon(closeButton, "x", 11, self.Theme.Muted)
    closeIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    closeIcon.Position = UDim2.fromScale(0.5, 0.5)
    closeIcon.ZIndex = 305

    local toastScale = create("UIScale", {
        Scale = 0.92,
        Parent = toast,
    })

    local closed = false
    local handle = {}
    function handle:Close()
        if closed or not toast.Parent then
            return
        end
        closed = true
        local animation = tween(toast, { GroupTransparency = 1 }, TWEEN_CLOSE)
        tween(toastScale, { Scale = 0.94 }, TWEEN_CLOSE)
        if animation then
            animation.Completed:Once(function()
                if toast then
                    toast:Destroy()
                end
            end)
        else
            toast:Destroy()
        end
    end

    self:_connect(closeButton.MouseEnter, function()
        tween(closeButton, {
            BackgroundTransparency = 0.1,
            BackgroundColor3 = mix(self.Theme.Danger, self.Theme.Topbar, 0.76),
        }, TWEEN_FAST)
        tween(closeIcon, { ImageColor3 = self.Theme.Text }, TWEEN_FAST)
    end)
    self:_connect(closeButton.MouseLeave, function()
        tween(closeButton, { BackgroundTransparency = 1 }, TWEEN_FAST)
        tween(closeIcon, { ImageColor3 = self.Theme.Muted }, TWEEN_FAST)
    end)
    self:_connect(closeButton.Activated, function()
        handle:Close()
    end)

    tween(toast, { GroupTransparency = 0 }, TWEEN_NORMAL)
    tween(toastScale, { Scale = 1 }, TWEEN_POP)
    task.delay(tonumber(options.Duration) or 4, function()
        handle:Close()
    end)
    return handle
end

function Mytrah:Notify(options)
    if self._activeWindow then
        return self._activeWindow:Notify(options)
    end
    return nil
end

local Category = {}
Category.__index = Category

local Tab = {}
Tab.__index = Tab

local SubTab = {}
SubTab.__index = SubTab

local Section = {}
Section.__index = Section

function Section:GetControlScale()
    return 1
end

function Window:AddCategory(title)
    local options = type(title) == "table" and title or { Title = title }
    local category = setmetatable({
        Window = self,
        Title = options.Title or "Category",
        Tabs = {},
    }, Category)

    local categoryWidth = math.max(78, math.min(150, #category.Title * 7 + 28))
    local topButton = create("TextButton", {
        Name = "Category_" .. category.Title,
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(categoryWidth, 30),
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Text = "",
        LayoutOrder = #self.Categories + 1,
        Parent = self.CategoryBar,
    })
    addCorner(topButton, 10)
    self:_paint(topButton, "BackgroundColor3", "Topbar")
    local topScale = create("UIScale", {
        Scale = 1,
        Parent = topButton,
    })

    local topTitle = create("TextLabel", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Font = SEMIBOLD_FONT,
        Text = category.Title,
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = topButton,
    })
    self:_paint(topTitle, "TextColor3", "Muted")

    local topLine = create("Frame", {
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 1, -1),
        Size = UDim2.new(1, -20, 0, 2),
        Visible = false,
        BorderSizePixel = 0,
        Parent = topButton,
    })
    addCorner(topLine, 2)
    self:_paint(topLine, "BackgroundColor3", "Accent")
    category.TopButton = topButton
    category.TopTitle = topTitle
    category.TopLine = topLine

    self:_connect(topButton.Activated, function()
        local firstTab = category.Tabs[1]
        if firstTab then
            self:SelectTab(firstTab)
        end
    end)
    self:_connect(topButton.MouseEnter, function()
        if self.SelectedTab and self.SelectedTab.Category == category then
            return
        end
        tween(topButton, { BackgroundTransparency = 0.35, BackgroundColor3 = self.Theme.Control })
        tween(topTitle, { TextColor3 = self.Theme.Text })
        tween(topScale, { Scale = 1.035 }, TWEEN_POP)
    end)
    self:_connect(topButton.MouseLeave, function()
        if self.SelectedTab and self.SelectedTab.Category == category then
            return
        end
        tween(topButton, { BackgroundTransparency = 1, BackgroundColor3 = self.Theme.Topbar })
        tween(topTitle, { TextColor3 = self.Theme.Muted })
        tween(topScale, { Scale = 1 }, TWEEN_FAST)
    end)

    self._layoutOrder = self._layoutOrder + 1
    local label = create("TextLabel", {
        Name = "Category",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 25),
        Font = SEMIBOLD_FONT,
        Text = string.upper(category.Title),
        TextSize = 9,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = self._layoutOrder,
        Parent = self.Navigation,
    })
    addPadding(label, 8, 0, 7, 0)
    self:_paint(label, "TextColor3", "Muted")
    category.Label = label

    table.insert(self.Categories, category)
    return category
end

function Category:AddTab(options)
    options = type(options) == "table" and options or { Title = tostring(options) }
    options.Category = self
    return self.Window:AddTab(options)
end

local function makeColumn(window, parent, side, topOffset)
    local isRight = side == "Right"
    local top = tonumber(topOffset) or 13
    local viewport = create("Frame", {
        Name = side .. "Viewport",
        BackgroundTransparency = 1,
        Position = isRight and UDim2.new(0.5, 7, 0, top) or UDim2.fromOffset(14, top),
        Size = UDim2.new(0.5, -21, 1, -top),
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = parent,
    })
    local column = create("ScrollingFrame", {
        Name = side,
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.fromScale(1, 1),
        BorderSizePixel = 0,
        CanvasSize = UDim2.new(),
        ClipsDescendants = true,
        Active = true,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingEnabled = true,
        ScrollBarThickness = 0,
        ScrollBarImageTransparency = 1,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        Parent = viewport,
    })
    window:_paint(column, "ScrollBarImageColor3", "Accent")

    local layout = create("UIListLayout", {
        Padding = UDim.new(0, 11),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = column,
    })
    addPadding(column, 0, 5, 0, 6)

    window:_connect(layout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
        column.CanvasSize = UDim2.fromOffset(0, layout.AbsoluteContentSize.Y + 8)
    end)

    local topMask = create("Frame", {
        Name = side .. "TopMask",
        BackgroundTransparency = 0,
        Position = isRight and UDim2.new(0.5, 7, 0, 0) or UDim2.fromOffset(14, 0),
        Size = UDim2.new(0.5, -21, 0, top),
        BorderSizePixel = 0,
        ZIndex = 20,
        Parent = parent,
    })
    window:_paint(topMask, "BackgroundColor3", "Background")

    local refreshing = false
    local function refreshViewport()
        if refreshing or not column.Parent then
            return
        end
        refreshing = true

        column.CanvasSize = UDim2.fromOffset(0, layout.AbsoluteContentSize.Y + 8)
        for _, sectionFrame in ipairs(column:GetChildren()) do
            local body = sectionFrame:IsA("Frame") and sectionFrame:FindFirstChild("Body")
            if body then
                local sectionVisible = sectionFrame.Visible
                local surface = sectionFrame:FindFirstChild("Surface")
                local header = sectionFrame:FindFirstChild("Header")
                local divider = sectionFrame:FindFirstChild("Divider")
                if surface then
                    surface.Visible = sectionVisible
                end
                if header then
                    header.Visible = sectionVisible
                end
                if divider then
                    divider.Visible = sectionVisible
                end

                for _, row in ipairs(body:GetChildren()) do
                    if row.Name:match("^ViewportSpacer_") then
                        row:Destroy()
                    elseif row:IsA("GuiObject") and not row:IsA("UIListLayout") then
                        row.Visible = row:GetAttribute("MytrahBaseVisible") ~= false
                    end
                end
            end
        end

        refreshing = false
    end

    table.insert(window._columnRefreshers, refreshViewport)
    window:_connect(layout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
        task.defer(refreshViewport)
    end)
    task.defer(refreshViewport)
    return column, layout
end

function Window:AddTab(options)
    options = type(options) == "table" and options or { Title = tostring(options) }

    local category = options.Category
    if type(category) == "string" then
        local categoryTitle = category
        category = nil
        for _, candidate in ipairs(self.Categories) do
            if candidate.Title == categoryTitle then
                category = candidate
                break
            end
        end
        category = category or self:AddCategory(categoryTitle)
    end

    local tab = setmetatable({
        Window = self,
        Category = category,
        Title = options.Title or "Tab",
        Description = options.Description or options.Subtitle or "",
        Icon = options.Icon or "circle",
        Id = options.Id or options.Flag or options.Title,
        Sections = {},
        SubTabs = {},
        SelectedSubTab = nil,
        _leftCount = 0,
        _rightCount = 0,
    }, Tab)

    self._layoutOrder = self._layoutOrder + 1
    local navButton = create("TextButton", {
        Name = tab.Title,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 40),
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Font = DEFAULT_FONT,
        Text = "",
        LayoutOrder = self._layoutOrder,
        Parent = self.Navigation,
    })
    addCorner(navButton, 11)

    local activeBar = create("Frame", {
        Name = "Active",
        Visible = false,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 0, 0.5, 0),
        Size = UDim2.fromOffset(3, 21),
        BorderSizePixel = 0,
        Parent = navButton,
    })
    addCorner(activeBar, 3)
    self:_paint(activeBar, "BackgroundColor3", "Accent")

    local navIcon = self:_makeIcon(navButton, tab.Icon, 16, "Muted")
    navIcon.AnchorPoint = Vector2.new(0, 0.5)
    navIcon.Position = UDim2.new(0, 14, 0.5, 0)

    local navTitle = create("TextLabel", {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(42, 0),
        Size = UDim2.new(1, -49, 1, 0),
        Font = DEFAULT_FONT,
        Text = tab.Title,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = navButton,
    })
    self:_paint(navTitle, "TextColor3", "Muted")

    local navScale = create("UIScale", {
        Scale = 1,
        Parent = navButton,
    })

    local page = create("Frame", {
        Name = tab.Title,
        Visible = false,
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.new(1, 0, 1, 0),
        ClipsDescendants = true,
        Parent = self.Content,
    })
    local pageScale = create("UIScale", {
        Scale = 1,
        Parent = page,
    })

    local subtabBar = create("ScrollingFrame", {
        Name = "Subtabs",
        Visible = false,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, CATEGORY_BAR_HEIGHT),
        BorderSizePixel = 0,
        CanvasSize = UDim2.new(),
        ScrollBarImageTransparency = 1,
        ScrollBarThickness = 0,
        ScrollingDirection = Enum.ScrollingDirection.X,
        ZIndex = 50,
        Parent = page,
    })
    addPadding(subtabBar, 14, 14, 2, 2)
    local subtabLayout = create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Padding = UDim.new(0, 6),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = subtabBar,
    })
    self:_connect(subtabLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
        subtabBar.CanvasSize = UDim2.fromOffset(subtabLayout.AbsoluteContentSize.X + 28, 0)
    end)

    local leftColumn, leftLayout = makeColumn(self, page, "Left")
    local rightColumn, rightLayout = makeColumn(self, page, "Right")

    tab.NavButton = navButton
    tab.NavIcon = navIcon
    tab.NavTitle = navTitle
    tab.ActiveBar = activeBar
    tab.Page = page
    tab.PageScale = pageScale
    tab.SubtabBar = subtabBar
    tab.SubtabLayout = subtabLayout
    tab.LeftColumn = leftColumn
    tab.LeftLayout = leftLayout
    tab.RightColumn = rightColumn
    tab.RightLayout = rightLayout

    self:_connect(navButton.Activated, function()
        self:SelectTab(tab)
    end)
    self:_connect(navButton.MouseEnter, function()
        if self.SelectedTab ~= tab then
            tween(navButton, { BackgroundTransparency = 0.25, BackgroundColor3 = self.Theme.Control })
            tween(navTitle, { TextColor3 = self.Theme.Text })
            tween(navScale, { Scale = 1.025 }, TWEEN_POP)
        end
    end)
    self:_connect(navButton.MouseLeave, function()
        if self.SelectedTab ~= tab then
            tween(navButton, { BackgroundTransparency = 1, BackgroundColor3 = self.Theme.Sidebar })
            tween(navTitle, { TextColor3 = self.Theme.Muted })
            tween(navScale, { Scale = 1 }, TWEEN_FAST)
        end
    end)

    table.insert(self.Tabs, tab)
    if category and not table.find(category.Tabs, tab) then
        table.insert(category.Tabs, tab)
    end

    if not self.SelectedTab then
        self:SelectTab(tab)
    else
        self:_refreshNavigation()
    end

    return tab
end

function Tab:Select()
    self.Window:SelectTab(self)
    return self
end

function Tab:_addSection(options, owner)
    options = type(options) == "table" and options or { Title = tostring(options) }
    owner = owner or self
    local requestedSide = string.lower(options.Side or "")
    local side

    if requestedSide == "left" then
        side = "Left"
    elseif requestedSide == "right" then
        side = "Right"
    elseif owner._leftCount <= owner._rightCount then
        side = "Left"
    else
        side = "Right"
    end

    if side == "Left" then
        owner._leftCount = owner._leftCount + 1
    else
        owner._rightCount = owner._rightCount + 1
    end

    local section = setmetatable({
        Tab = self,
        SubTab = owner ~= self and owner or nil,
        Window = self.Window,
        Title = options.Title or "Section",
        Side = side,
        Controls = {},
        _collapsed = options.Expanded == false,
        _layoutOrder = 0,
        _sideOrder = side == "Left" and owner._leftCount or owner._rightCount,
    }, Section)

    local holder = side == "Left" and owner.LeftColumn or owner.RightColumn
    local frame = create("Frame", {
        Name = section.Title,
        Size = UDim2.new(1, 0, 0, 47),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = holder,
    })

    local frameSurface = create("Frame", {
        Name = "Surface",
        Size = UDim2.new(1, 0, 0, 47),
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ZIndex = 1,
        Parent = frame,
    })
    addCorner(frameSurface, PANEL_RADIUS)
    local frameStroke = addStroke(frameSurface, self.Window.Theme.Border, 0.5, 1)
    self.Window:_paint(frameSurface, "BackgroundColor3", "Section")
    self.Window:_paint(frameStroke, "Color", "Border")

    local header = create("TextButton", {
        Name = "Header",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 47),
        AutoButtonColor = false,
        Font = DEFAULT_FONT,
        Text = "",
        ZIndex = 2,
        Parent = frame,
    })

    local sectionIcon = self.Window:_makeIcon(header, options.Icon or "sliders", 16, "Accent")
    sectionIcon.AnchorPoint = Vector2.new(0, 0.5)
    sectionIcon.Position = UDim2.new(0, 14, 0.5, 0)

    local title = create("TextLabel", {
        Name = "Title",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(43, 0),
        Size = UDim2.new(1, -76, 1, 0),
        Font = SEMIBOLD_FONT,
        Text = section.Title,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = header,
    })
    self.Window:_paint(title, "TextColor3", "Text")

    local collapseIcon = self.Window:_makeIcon(header, "chevron-up", 14, "Muted")
    collapseIcon.AnchorPoint = Vector2.new(1, 0.5)
    collapseIcon.Position = UDim2.new(1, -14, 0.5, 0)
    collapseIcon.Rotation = section._collapsed and 180 or 0

    local divider = create("Frame", {
        Name = "Divider",
        Position = UDim2.fromOffset(14, 46),
        Size = UDim2.new(1, -28, 0, 1),
        BackgroundTransparency = 0.45,
        BorderSizePixel = 0,
        ZIndex = 3,
        Parent = frame,
    })
    self.Window:_paint(divider, "BackgroundColor3", "Border")

    local body = create("CanvasGroup", {
        Name = "Body",
        Visible = not section._collapsed,
        BackgroundTransparency = 1,
        GroupTransparency = section._collapsed and 1 or 0,
        Position = UDim2.fromOffset(14, 54),
        Size = UDim2.new(1, -28, 0, 0),
        ZIndex = 2,
        Parent = frame,
    })

    local bodyLayout = create("UIListLayout", {
        Padding = UDim.new(0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = body,
    })

    section.Frame = frame
    section.Header = header
    section.TitleLabel = title
    section.Body = body
    section.Layout = bodyLayout
    section.CollapseIcon = collapseIcon

    self.Window:_connect(bodyLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
        section:_updateSize()
    end)
    self.Window:_connect(header.Activated, function()
        section:SetExpanded(section._collapsed)
    end)

    table.insert(owner.Sections, section)
    if owner ~= self then
        table.insert(self.Sections, section)
    end
    section:_updateSize()
    self.Window:_updateResponsiveLayout()
    return section
end

function Tab:_refreshSubtabs()
    local hasSubtabs = #self.SubTabs > 0
    self.SubtabBar.Visible = hasSubtabs
    self.LeftColumn.Visible = not hasSubtabs
    self.RightColumn.Visible = not hasSubtabs

    for _, subtab in ipairs(self.SubTabs) do
        local active = self.SelectedSubTab == subtab
        subtab.Page.Visible = active
        subtab.Button.Visible = true
        subtab.Button.BackgroundTransparency = active and 0.08 or 1
        subtab.Button.BackgroundColor3 = active
            and mix(self.Window.Theme.AccentDark, self.Window.Theme.Topbar, 0.28)
            or self.Window.Theme.Topbar
        subtab.IconImage.ImageColor3 = active and self.Window.Theme.Accent or self.Window.Theme.Muted
        subtab.TitleLabel.TextColor3 = active and self.Window.Theme.Text or self.Window.Theme.Muted
        subtab.Line.Visible = active
    end
end

function Tab:_createSubTab(options)
    options = options or {}
    local subtab = setmetatable({
        Tab = self,
        Window = self.Window,
        Title = options.Title or "Subtab",
        IconName = options.Icon or "circle",
        Sections = {},
        _leftCount = 0,
        _rightCount = 0,
    }, SubTab)

    local subPage = create("Frame", {
        Name = "Subtab_" .. tostring(subtab.Title),
        Visible = false,
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(0, CATEGORY_BAR_HEIGHT),
        Size = UDim2.new(1, 0, 1, -CATEGORY_BAR_HEIGHT),
        ClipsDescendants = true,
        Parent = self.Page,
    })
    local leftColumn, leftLayout = makeColumn(self.Window, subPage, "Left")
    local rightColumn, rightLayout = makeColumn(self.Window, subPage, "Right")

    local buttonWidth = math.clamp(#tostring(subtab.Title) * 7 + 42, 92, 164)
    local button = create("TextButton", {
        Name = "SubtabButton_" .. tostring(subtab.Title),
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(buttonWidth, 30),
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Text = "",
        LayoutOrder = #self.SubTabs + 1,
        ZIndex = 51,
        Parent = self.SubtabBar,
    })
    addCorner(button, 10)
    self.Window:_paint(button, "BackgroundColor3", "Topbar")

    local icon = self.Window:_makeIcon(button, subtab.IconName, 13, "Muted")
    icon.AnchorPoint = Vector2.new(0, 0.5)
    icon.Position = UDim2.new(0, 10, 0.5, 0)
    icon.ZIndex = 52

    local titleLabel = create("TextLabel", {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(28, 0),
        Size = UDim2.new(1, -36, 1, 0),
        Font = SEMIBOLD_FONT,
        Text = tostring(subtab.Title),
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        ZIndex = 52,
        Parent = button,
    })
    self.Window:_paint(titleLabel, "TextColor3", "Muted")

    local line = create("Frame", {
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 1, -1),
        Size = UDim2.new(1, -20, 0, 2),
        Visible = false,
        BorderSizePixel = 0,
        ZIndex = 52,
        Parent = button,
    })
    addCorner(line, 2)
    self.Window:_paint(line, "BackgroundColor3", "Accent")

    local buttonScale = create("UIScale", {
        Scale = 1,
        Parent = button,
    })

    subtab.Page = subPage
    subtab.LeftColumn = leftColumn
    subtab.LeftLayout = leftLayout
    subtab.RightColumn = rightColumn
    subtab.RightLayout = rightLayout
    subtab.Button = button
    subtab.IconImage = icon
    subtab.TitleLabel = titleLabel
    subtab.Line = line
    subtab.Scale = buttonScale

    self.Window:_connect(button.Activated, function()
        subtab:Select()
    end)
    self.Window:_connect(button.MouseEnter, function()
        if self.SelectedSubTab ~= subtab then
            tween(button, { BackgroundTransparency = 0.35, BackgroundColor3 = self.Window.Theme.Control }, TWEEN_FAST)
            tween(icon, { ImageColor3 = self.Window.Theme.Accent }, TWEEN_FAST)
            tween(titleLabel, { TextColor3 = self.Window.Theme.Text }, TWEEN_FAST)
            tween(buttonScale, { Scale = 1.03 }, TWEEN_POP)
        end
    end)
    self.Window:_connect(button.MouseLeave, function()
        if self.SelectedSubTab ~= subtab then
            tween(button, { BackgroundTransparency = 1, BackgroundColor3 = self.Window.Theme.Topbar }, TWEEN_FAST)
            tween(icon, { ImageColor3 = self.Window.Theme.Muted }, TWEEN_FAST)
            tween(titleLabel, { TextColor3 = self.Window.Theme.Muted }, TWEEN_FAST)
            tween(buttonScale, { Scale = 1 }, TWEEN_FAST)
        end
    end)

    table.insert(self.SubTabs, subtab)
    if not self.SelectedSubTab then
        self.SelectedSubTab = subtab
    end
    self:_refreshSubtabs()
    return subtab
end

function Tab:AddSubTab(options)
    options = type(options) == "table" and options or { Title = tostring(options) }
    local hadDirectSections = #self.SubTabs == 0 and #self.Sections > 0
    local general
    if hadDirectSections then
        general = self:_createSubTab({ Title = "General", Icon = "layers" })
        for _, section in ipairs(self.Sections) do
            if not section.SubTab then
                local holder = section.Side == "Left" and general.LeftColumn or general.RightColumn
                section.Frame.Parent = holder
                section.SubTab = general
                table.insert(general.Sections, section)
                if section.Side == "Left" then
                    general._leftCount = general._leftCount + 1
                else
                    general._rightCount = general._rightCount + 1
                end
            end
        end
    end

    local subtab = self:_createSubTab(options)
    if general then
        subtab:Select(true)
    end
    self.Window:_updateResponsiveLayout()
    return subtab
end

function Tab:AddSection(options)
    if #self.SubTabs > 0 then
        local target = self.SelectedSubTab or self.SubTabs[1]
        return target:AddSection(options)
    end
    return self:_addSection(options, self)
end

function Tab:AddColumns()
    return self, self
end

function Tab:SelectSubTab(subtab, silent)
    if type(subtab) == "string" then
        for _, candidate in ipairs(self.SubTabs) do
            if candidate.Title == subtab then
                subtab = candidate
                break
            end
        end
    end
    if type(subtab) ~= "table" or subtab.Tab ~= self then
        return self
    end

    self.SelectedSubTab = subtab
    self:_refreshSubtabs()
    if not silent then
        self.Window:_refreshNavigation()
    end
    return self
end

function SubTab:AddSection(options)
    return self.Tab:_addSection(options, self)
end

function SubTab:AddColumns()
    return self, self
end

function SubTab:Select(silent)
    self.Tab:SelectSubTab(self, silent)
    return self
end

function Section:_updateSize(animated)
    if not self.Frame or not self.Frame.Parent then
        return
    end

    local bodyHeight = self.Layout.AbsoluteContentSize.Y
    self.Body.Size = UDim2.new(1, -28, 0, bodyHeight)
    local height = self._collapsed and 47 or bodyHeight + 62
    if animated then
        return tween(self.Frame, { Size = UDim2.new(1, 0, 0, height) }, TWEEN_NORMAL)
    end
    self.Frame.Size = UDim2.new(1, 0, 0, height)
end

function Section:SetExpanded(expanded)
    expanded = expanded == true
    local nextCollapsed = not expanded
    if self._collapsed == nextCollapsed then
        return self
    end

    self._collapsed = nextCollapsed
    self._collapseToken = (self._collapseToken or 0) + 1
    local token = self._collapseToken
    tween(self.CollapseIcon, { Rotation = expanded and 0 or 180 }, TWEEN_NORMAL)

    if expanded then
        self.Body.Visible = true
        self.Body.GroupTransparency = 1
        self:_updateSize(true)
        tween(self.Body, { GroupTransparency = 0 }, TWEEN_NORMAL)
    else
        self.Body.Visible = true
        tween(self.Body, { GroupTransparency = 1 }, TWEEN_FAST)
        local animation = self:_updateSize(true)
        if animation then
            animation.Completed:Once(function()
                if token == self._collapseToken and self._collapsed and self.Body.Parent then
                    self.Body.Visible = false
                end
            end)
        else
            self.Body.Visible = false
        end
    end
    return self
end

function Section:SetTitle(title)
    self.Title = tostring(title)
    self.TitleLabel.Text = self.Title
    return self
end

function Section:_makeRow(options, height, clickable)
    options = options or {}
    self._layoutOrder = self._layoutOrder + 1

    local className = clickable and "TextButton" or "Frame"
    local row = create(className, {
        Name = options.Title or "Control",
        Size = UDim2.new(1, 0, 0, height),
        BackgroundTransparency = 0.55,
        BorderSizePixel = 0,
        LayoutOrder = self._layoutOrder,
        Parent = self.Body,
    })
    row:SetAttribute("MytrahBaseVisible", true)
    if clickable then
        row.Text = ""
        row.AutoButtonColor = false
    end
    addCorner(row, CONTROL_RADIUS)
    local rowStroke = addStroke(row, self.Window.Theme.Border, 0.9, 1)
    self.Window:_paint(row, "BackgroundColor3", "Control")
    self.Window:_paint(rowStroke, "Color", "Border")

    local hasIcon = options.Icon ~= nil
    local titleOffset = hasIcon and 39 or 13
    if hasIcon then
        local icon = self.Window:_makeIcon(row, options.Icon, 16, "Muted")
        icon.AnchorPoint = Vector2.new(0, 0.5)
        icon.Position = UDim2.new(0, 14, 0.5, options.Description and -8 or 0)
        row:SetAttribute("MytrahHasIcon", true)
    end

    local title = create("TextLabel", {
        Name = "Title",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(titleOffset, options.Description and 8 or 0),
        Size = UDim2.new(1, -(titleOffset + 78), options.Description and 0 or 1, options.Description and 20 or 0),
        Font = DEFAULT_FONT,
        Text = options.Title or "Control",
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = row,
    })
    self.Window:_paint(title, "TextColor3", "Text")

    local description
    if options.Description then
        description = create("TextLabel", {
            Name = "Description",
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(titleOffset, 28),
            Size = UDim2.new(1, -(titleOffset + 78), 0, 18),
            Font = DEFAULT_FONT,
            Text = options.Description,
            TextSize = 10,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            Parent = row,
        })
        self.Window:_paint(description, "TextColor3", "Muted")
    end

    local rowScale = create("UIScale", {
        Scale = 1,
        Parent = row,
    })

    self.Window:_connect(row.MouseEnter, function()
        tween(row, { BackgroundColor3 = self.Window.Theme.ControlHover, BackgroundTransparency = 0.12 })
        tween(rowStroke, { Transparency = 0.55 })
        tween(rowScale, { Scale = 1.015 }, TWEEN_POP)
    end)
    self.Window:_connect(row.MouseLeave, function()
        tween(row, { BackgroundColor3 = self.Window.Theme.Control, BackgroundTransparency = 0.55 })
        tween(rowStroke, { Transparency = 0.9 })
        tween(rowScale, { Scale = 1 }, TWEEN_FAST)
    end)

    return row, title, description
end

function Section:_prepareControl(options, control, row, titleLabel)
    control.Type = control.Type or "Control"
    control.Flag = options.Flag or options.Id
    control.Instance = row
    control.Section = self
    control.Window = self.Window
    control._visible = true
    control._searchTitle = tostring(options.Title or control.Type)
    control._searchDescription = tostring(options.Description or "")
    control._searchText = string.lower(table.concat({
        control._searchTitle,
        control._searchDescription,
        tostring(self.Title),
        tostring(control.Flag or ""),
        tostring(control.Type),
    }, " "))
    control._changed = Instance.new("BindableEvent")

    function control:GetValue()
        return self.Value
    end

    function control:OnChanged(callback)
        return self._changed.Event:Connect(callback)
    end

    function control:SetVisible(visible)
        self._visible = visible == true
        self.Window:_refreshNavigation()
        return self
    end

    function control:SetTitle(title)
        self._searchTitle = tostring(title)
        self._searchText = string.lower(table.concat({
            self._searchTitle,
            self._searchDescription,
            tostring(self.Section.Title),
            tostring(self.Flag or ""),
            tostring(self.Type),
        }, " "))
        titleLabel.Text = self._searchTitle
        self.Window:_refreshNavigation()
        return self
    end

    function control:Destroy()
        if self.Flag and self.Window.Options[self.Flag] == self then
            self.Window.Options[self.Flag] = nil
        end
        if self.Flag and Mytrah.Options[self.Flag] == self then
            Mytrah.Options[self.Flag] = nil
        end
        self._changed:Destroy()
        row:Destroy()
    end

    function control:_emit(value)
        self._changed:Fire(value)
        if not self.Window._loadingConfig then
            self.Window:_queueConfigSave()
        end
        safeCallback(options.Callback, value)
    end

    if control.Flag then
        self.Window.Options[control.Flag] = control
        Mytrah.Options[control.Flag] = control
    end

    table.insert(self.Controls, control)
    return control
end

function Section:AddToggle(options, legacyOptions)
    if type(options) == "string" then
        legacyOptions = type(legacyOptions) == "table" and legacyOptions or {}
        legacyOptions.Flag = options
        options = legacyOptions
    end
    options = options or {}
    local controlScale = self:GetControlScale()
    local rowHeight = options.Description and math.floor(64 * controlScale) or math.floor(50 * controlScale)
    local row, title, description = self:_makeRow(options, rowHeight, true)
    local control = self:_prepareControl(options, {
        Type = "Toggle",
        Value = options.Default == true,
    }, row, title)
    local titleOffset = options.Icon and 39 or 13
    title.Size = UDim2.new(1, -(titleOffset + 70), options.Description and 0 or 1, options.Description and 20 or 0)
    if description then
        description.Size = UDim2.new(1, -(titleOffset + 70), 0, 18)
    end

    local switch = create("Frame", {
        Name = "Switch",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -14, 0.5, 0),
        Size = UDim2.fromOffset(42, 24),
        BorderSizePixel = 0,
        Parent = row,
    })
    addCorner(switch, 12)

    local switchScale = create("UIScale", {
        Scale = 1,
        Parent = switch,
    })

    local knob = create("Frame", {
        Name = "Knob",
        AnchorPoint = Vector2.new(0, 0.5),
        Size = UDim2.fromOffset(18, 18),
        BorderSizePixel = 0,
        Parent = switch,
    })
    addCorner(knob, 9)

    switchScale.Scale = controlScale
    knob.Size = UDim2.fromOffset(18 * controlScale, 18 * controlScale)

    local function refresh(animated)
        local switchColor = control.Value and self.Window.Theme.Accent or self.Window.Theme.Border
        local knobColor = control.Value and self.Window.Theme.Background or self.Window.Theme.Text
        local knobPosition = control.Value and UDim2.new(1, -21, 0.5, 0) or UDim2.new(0, 3, 0.5, 0)

        if animated then
            tween(switch, { BackgroundColor3 = switchColor })
            tween(knob, { Position = knobPosition, BackgroundColor3 = knobColor }, TWEEN_POP)
        else
            switch.BackgroundColor3 = switchColor
            knob.Position = knobPosition
            knob.BackgroundColor3 = knobColor
        end
    end

    function control:SetValue(value, silent)
        local nextValue = value == true
        if self.Value == nextValue then
            return self
        end
        self.Value = nextValue
        refresh(true)
        if not silent then
            self:_emit(self.Value)
        end
        return self
    end

    self.Window:_connect(row.Activated, function()
        control:SetValue(not control.Value)
    end)
    self.Window:_onTheme(function()
        refresh(false)
    end)
    refresh(false)
    return control
end

function Section:AddButton(options)
    options = options or {}
    local row, title, description = self:_makeRow(options, options.Description and 64 or 50, true)
    local control = self:_prepareControl(options, {
        Type = "Button",
        Value = false,
    }, row, title)
    local titleOffset = options.Icon and 39 or 13
    title.Size = UDim2.new(1, -(titleOffset + 70), options.Description and 0 or 1, options.Description and 20 or 0)
    if description then
        description.Size = UDim2.new(1, -(titleOffset + 70), 0, 18)
    end

    local arrow = self.Window:_makeIcon(row, options.RightIcon or "arrow-right", 16, "Muted")
    arrow.AnchorPoint = Vector2.new(1, 0.5)
    arrow.Position = UDim2.new(1, -15, 0.5, 0)
    local arrowScale = create("UIScale", {
        Scale = 1,
        Parent = arrow,
    })
    self.Window:_connect(row.MouseEnter, function()
        tween(arrow, { ImageColor3 = self.Window.Theme.Accent }, TWEEN_FAST)
        tween(arrowScale, { Scale = 1.14 }, TWEEN_FAST)
    end)
    self.Window:_connect(row.MouseLeave, function()
        tween(arrow, { ImageColor3 = self.Window.Theme.Muted }, TWEEN_FAST)
        tween(arrowScale, { Scale = 1 }, TWEEN_FAST)
    end)

    function control:Fire()
        self._changed:Fire()
        safeCallback(options.Callback)
        tween(arrow, { Position = UDim2.new(1, -11, 0.5, 0) })
        task.delay(0.12, function()
            if arrow.Parent then
                tween(arrow, { Position = UDim2.new(1, -15, 0.5, 0) })
            end
        end)
        return self
    end

    self.Window:_connect(row.Activated, function()
        control:Fire()
    end)
    return control
end

local function roundToStep(value, minimum, maximum, step)
    local clamped = math.clamp(value, minimum, maximum)
    local rounded = math.floor(((clamped - minimum) / step) + 0.5) * step + minimum
    return math.clamp(rounded, minimum, maximum)
end

local function formatNumber(value, step)
    if step >= 1 then
        return tostring(math.floor(value + 0.5))
    end

    local decimals = math.max(0, math.ceil(-math.log10(step)))
    return string.format("%." .. tostring(math.min(decimals, 4)) .. "f", value)
end

function Section:AddSlider(options, legacyOptions)
    if type(options) == "string" then
        legacyOptions = type(legacyOptions) == "table" and legacyOptions or {}
        legacyOptions.Flag = options
        options = legacyOptions
    end
    options = options or {}
    local minimum = tonumber(options.Min) or 0
    local maximum = tonumber(options.Max) or 100
    local legacyStep = options.Step
    if legacyStep == nil and options.Rounding ~= nil then
        legacyStep = 10 ^ -math.max(0, tonumber(options.Rounding) or 0)
    end
    local step = math.max(tonumber(legacyStep) or 1, 0.0001)
    local valueWidth = math.clamp(tonumber(options.ValueWidth) or 68, 56, 104)
    assert(maximum > minimum, "Slider Max must be greater than Min")

    local controlScale = self:GetControlScale()
    local rowHeight = options.Description and math.floor(86 * controlScale) or math.floor(76 * controlScale)

    local row, title, description = self:_makeRow(options, rowHeight, false)
    local titleOffset = options.Icon and 39 or 13
    title.Size = UDim2.new(1, -(titleOffset + valueWidth + 46), 0, 20)
    if description then
        description.Size = UDim2.new(1, -(titleOffset + valueWidth + 46), 0, 18)
    end
    if not options.Description then
        local sliderIcon = row:FindFirstChild("Icon")
        if sliderIcon then
            sliderIcon.Position = UDim2.new(0, 14, 0, 11)
        end
    end

    local control = self:_prepareControl(options, {
        Type = "Slider",
        Value = roundToStep(tonumber(options.Default) or minimum, minimum, maximum, step),
        Min = minimum,
        Max = maximum,
        Step = step,
    }, row, title)

    local controlScale = self:GetControlScale()
    local scaledValueWidth = math.floor(valueWidth * controlScale)
    local scaledValueHeight = math.floor(24 * controlScale)
    local scaledBarHeight = math.max(7, math.floor(7 * controlScale))
    local scaledKnobSize = math.floor(18 * controlScale)
    local scaledKnobHaloSize = math.floor(24 * controlScale)
    local scaledBarY = options.Description and math.floor(68 * controlScale) or math.floor(57 * controlScale)

    local valueBack = create("Frame", {
        Name = "ValueBack",
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -12, 0, math.floor(7 * controlScale)),
        Size = UDim2.fromOffset(scaledValueWidth, scaledValueHeight),
        BorderSizePixel = 0,
        Parent = row,
    })
    addCorner(valueBack, 8)
    local valueStroke = addStroke(valueBack, self.Window.Theme.Accent, 0.65, 1)
    self.Window:_paint(valueBack, "BackgroundColor3", "ControlHover")
    self.Window:_paint(valueStroke, "Color", "Accent")

    local valueInput = create("TextBox", {
        Name = "Value",
        Position = UDim2.fromScale(0, 0),
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        ClearTextOnFocus = false,
        Font = SEMIBOLD_FONT,
        Text = "",
        TextSize = math.floor(11 * controlScale),
        TextXAlignment = Enum.TextXAlignment.Center,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = valueBack,
    })
    self.Window:_paint(valueInput, "TextColor3", "Accent")

    local barY = scaledBarY
    local bar = create("Frame", {
        Name = "Bar",
        Position = UDim2.fromOffset(13, barY),
        Size = UDim2.new(1, -26, 0, scaledBarHeight),
        BorderSizePixel = 0,
        Parent = row,
    })
    addCorner(bar, 3)
    bar.ClipsDescendants = false
    local barStroke = addStroke(bar, self.Window.Theme.Border, 0.55, 1)
    self.Window:_paint(bar, "BackgroundColor3", "ControlHover")
    self.Window:_paint(barStroke, "Color", "Border")

    local fill = create("Frame", {
        Name = "Fill",
        Size = UDim2.new(0, 0, 1, 0),
        BorderSizePixel = 0,
        Parent = bar,
    })
    addCorner(fill, 3)
    self.Window:_paint(fill, "BackgroundColor3", "Accent")

    local knobHalo = create("Frame", {
        Name = "Halo",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromOffset(scaledKnobHaloSize, scaledKnobHaloSize),
        BackgroundTransparency = 0.78,
        BorderSizePixel = 0,
        Parent = bar,
    })
    addCorner(knobHalo, 12)
    self.Window:_paint(knobHalo, "BackgroundColor3", "Accent")

    local knob = create("Frame", {
        Name = "Knob",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromOffset(scaledKnobSize, scaledKnobSize),
        BorderSizePixel = 0,
        Parent = bar,
    })
    addCorner(knob, 9)
    self.Window:_paint(knob, "BackgroundColor3", "Text")
    local knobStroke = addStroke(knob, self.Window.Theme.Accent, 0, 2)
    self.Window:_paint(knobStroke, "Color", "Accent")

    local hitbox = create("TextButton", {
        Name = "Hitbox",
        BackgroundTransparency = 1,
        Position = UDim2.new(0, -5, 0, math.floor(-10 * controlScale)),
        Size = UDim2.new(1, 10, 1, math.floor(20 * controlScale)),
        AutoButtonColor = false,
        Text = "",
        Parent = bar,
    })

    local knobScale = create("UIScale", {
        Scale = 1,
        Parent = knob,
    })
    local valueScale = create("UIScale", {
        Scale = 1,
        Parent = valueInput,
    })

    local editingValue = false
    local function formattedValue()
        return (options.Prefix or "") .. formatNumber(control.Value, step) .. (options.Suffix or "")
    end

    local function refresh(animated)
        local alpha = (control.Value - minimum) / (maximum - minimum)
        if not editingValue then
            valueInput.Text = formattedValue()
        end
        if animated then
            tween(fill, { Size = UDim2.fromScale(alpha, 1) }, TWEEN_NORMAL)
            tween(knob, { Position = UDim2.fromScale(alpha, 0.5) }, TWEEN_POP)
            tween(knobHalo, { Position = UDim2.fromScale(alpha, 0.5) }, TWEEN_POP)
            tween(valueScale, { Scale = 1.08 }, TWEEN_FAST)
            task.delay(0.08, function()
                if valueScale.Parent then
                    tween(valueScale, { Scale = 1 }, TWEEN_FAST)
                end
            end)
        else
            fill.Size = UDim2.fromScale(alpha, 1)
            knob.Position = UDim2.fromScale(alpha, 0.5)
            knobHalo.Position = UDim2.fromScale(alpha, 0.5)
        end
    end

    function control:SetValue(value, silent, instant)
        local numeric = tonumber(value)
        if not numeric then
            return self
        end
        local nextValue = roundToStep(numeric, minimum, maximum, step)
        if self.Value == nextValue then
            return self
        end
        self.Value = nextValue
        refresh(not instant)
        if not silent then
            self:_emit(self.Value)
        end
        return self
    end

    self.Window:_connect(valueInput.Focused, function()
        editingValue = true
        valueInput.Text = formatNumber(control.Value, step)
        valueInput.CursorPosition = #valueInput.Text + 1
        valueInput.SelectionStart = 1
        tween(valueStroke, { Transparency = 0, Color = self.Window.Theme.Accent }, TWEEN_FAST)
        tween(valueScale, { Scale = 1.04 }, TWEEN_FAST)
    end)
    self.Window:_connect(valueInput.FocusLost, function()
        editingValue = false
        control:SetValue(valueInput.Text)
        refresh(true)
        tween(valueStroke, { Transparency = 0.65, Color = self.Window.Theme.Accent }, TWEEN_FAST)
        tween(valueScale, { Scale = 1 }, TWEEN_FAST)
    end)

    local dragging = false
    local function setFromPosition(position)
        local width = math.max(bar.AbsoluteSize.X, 1)
        local alpha = math.clamp((position.X - bar.AbsolutePosition.X) / width, 0, 1)
        control:SetValue(minimum + ((maximum - minimum) * alpha), false, true)
    end

    self.Window:_connect(hitbox.InputBegan, function(input)
        local inputType = input.UserInputType
        if inputType == Enum.UserInputType.MouseButton1 or inputType == Enum.UserInputType.Touch then
            dragging = true
            tween(knobScale, { Scale = 1.2 }, TWEEN_POP)
            setFromPosition(input.Position)
        end
    end)
    self.Window:_connect(hitbox.MouseEnter, function()
        tween(knobScale, { Scale = 1.18 }, TWEEN_FAST)
    end)
    self.Window:_connect(hitbox.MouseLeave, function()
        if not dragging then
            tween(knobScale, { Scale = 1 }, TWEEN_FAST)
        end
    end)
    self.Window:_connect(UserInputService.InputChanged, function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch)
        then
            setFromPosition(input.Position)
        end
    end)
    self.Window:_connect(UserInputService.InputEnded, function(input)
        local inputType = input.UserInputType
        if inputType == Enum.UserInputType.MouseButton1 or inputType == Enum.UserInputType.Touch then
            dragging = false
            tween(knobScale, { Scale = 1 }, TWEEN_FAST)
        end
    end)

    control.TextBox = valueInput
    refresh(false)
    return control
end

local function copyArray(source)
    local result = {}
    if type(source) == "table" then
        for _, value in ipairs(source) do
            table.insert(result, value)
        end
    end
    return result
end

local function arrayContains(source, value)
    for index, candidate in ipairs(source) do
        if candidate == value then
            return true, index
        end
    end
    return false, nil
end

function Section:AddDropdown(options, legacyOptions)
    if type(options) == "string" then
        legacyOptions = type(legacyOptions) == "table" and legacyOptions or {}
        legacyOptions.Flag = options
        options = legacyOptions
    end
    options = options or {}
    local values = copyArray(options.Values or options.Options or {})
    local multi = options.Multi == true
    local defaultValue = options.Default
    if multi then
        defaultValue = copyArray(defaultValue)
    elseif defaultValue == nil then
        defaultValue = values[1]
    end

    local selectionWidth = math.clamp(tonumber(options.Width) or 82, 72, 180)
    local controlScale = self:GetControlScale()
    local rowHeight = options.Description and math.floor(64 * controlScale) or math.floor(50 * controlScale)
    local selectionHeight = math.floor(28 * controlScale)

    local row, title, description = self:_makeRow(options, rowHeight, true)
    local control = self:_prepareControl(options, {
        Type = "Dropdown",
        Value = defaultValue,
        Values = values,
        Multi = multi,
    }, row, title)
    local titleOffset = options.Icon and 39 or 13
    title.Size = UDim2.new(1, -(titleOffset + selectionWidth + 20), options.Description and 0 or 1, options.Description and 20 or 0)
    title.TextSize = 10
    if description then
        description.Size = UDim2.new(1, -(titleOffset + selectionWidth + 20), 0, 18)
    end

    local selectionBack = create("Frame", {
        Name = "SelectionBack",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -11, 0.5, 0),
        Size = UDim2.fromOffset(selectionWidth, selectionHeight),
        BorderSizePixel = 0,
        Parent = row,
    })
    addCorner(selectionBack, 8)
    local selectionStroke = addStroke(selectionBack, self.Window.Theme.Border, 0.45, 1)
    self.Window:_paint(selectionBack, "BackgroundColor3", "Background")
    self.Window:_paint(selectionStroke, "Color", "Border")

    local selection = create("TextLabel", {
        Name = "Selection",
        Position = UDim2.fromOffset(10, 0),
        Size = UDim2.new(1, -34, 1, 0),
        BackgroundTransparency = 1,
        Font = DEFAULT_FONT,
        Text = "",
        TextSize = math.floor(10 * controlScale),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = selectionBack,
    })
    self.Window:_paint(selection, "TextColor3", "Muted")

    local arrow = self.Window:_makeIcon(selectionBack, "chevron-down", math.floor(13 * controlScale), "Muted")
    arrow.AnchorPoint = Vector2.new(1, 0.5)
    arrow.Position = UDim2.new(1, -9, 0.5, 0)

    self.Window:_connect(row.MouseEnter, function()
        tween(selectionBack, { BackgroundColor3 = self.Window.Theme.ControlHover }, TWEEN_FAST)
        tween(selectionStroke, { Transparency = 0.2 }, TWEEN_FAST)
    end)
    self.Window:_connect(row.MouseLeave, function()
        tween(selectionBack, { BackgroundColor3 = self.Window.Theme.Background }, TWEEN_FAST)
        tween(selectionStroke, { Transparency = 0.45 }, TWEEN_FAST)
    end)

    local function displayValue()
        if multi then
            if #control.Value == 0 then
                return options.Placeholder or "None"
            elseif #control.Value == 1 then
                return tostring(control.Value[1])
            end
            return tostring(#control.Value) .. " selected"
        end
        return control.Value == nil and (options.Placeholder or "Select") or tostring(control.Value)
    end

    local function refresh()
        selection.Text = displayValue()
    end

    function control:SetValue(value, silent)
        local nextValue
        if multi then
            nextValue = {}
            if type(value) == "table" then
                for _, candidate in ipairs(value) do
                    if table.find(self.Values, candidate) and not table.find(nextValue, candidate) then
                        table.insert(nextValue, candidate)
                    end
                end
            end
        else
            if value ~= nil and not table.find(self.Values, value) then
                return self
            end
            nextValue = value
        end

        self.Value = nextValue
        refresh()
        if not silent then
            self:_emit(self.Value)
        end
        return self
    end

    function control:SetValues(nextValues, keepValue)
        self.Values = copyArray(nextValues)
        if not keepValue then
            self:SetValue(multi and {} or self.Values[1], true)
        else
            self:SetValue(self.Value, true)
        end
        return self
    end

    local popup
    local function openDropdown()
        if popup and popup.Parent then
            self.Window:_closePopup()
            return
        end
        self.Window:_closePopup()

        local rowPosition = row.AbsolutePosition
        local rowSize = row.AbsoluteSize
        local viewport = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1920, 1080)
        local width = math.max(184, math.min(rowSize.X, 300))
        local optionHeight = 34
        local searchable = options.Searchable == true or #control.Values >= 6
        local headerHeight = searchable and 70 or 36
        local height = math.min(#control.Values * optionHeight + headerHeight + 12, 280)
        height = math.max(height, searchable and 126 or 72)
        local maxX = math.max(8, viewport.X - width - 8)
        local x = math.clamp(rowPosition.X + rowSize.X - width, 8, maxX)
        local y = rowPosition.Y + rowSize.Y + 5
        if y + height > viewport.Y - 8 then
            y = rowPosition.Y - height - 5
        end
        y = math.max(8, y)

        popup = create("Frame", {
            Name = "DropdownPopup",
            Position = UDim2.fromOffset(x, y),
            Size = UDim2.fromOffset(width, height),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 400,
        })
        addCorner(popup, 11)
        local popupStroke = addStroke(popup, self.Window.Theme.Border, 1, 1)
        self.Window:_paint(popup, "BackgroundColor3", "Topbar")
        self.Window:_paint(popupStroke, "Color", "Border")
        local popupScale = create("UIScale", {
            Scale = 0.96,
            Parent = popup,
        })

        local popupTitle = create("TextLabel", {
            Name = "Title",
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(12, 7),
            Size = UDim2.new(1, -118, 0, 18),
            Font = SEMIBOLD_FONT,
            Text = options.Title or "Select option",
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            ZIndex = 401,
            Parent = popup,
        })
        self.Window:_paint(popupTitle, "TextColor3", "Text")

        local popupMode = create("TextLabel", {
            Name = "Mode",
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.new(1, -12, 0, 8),
            Size = UDim2.fromOffset(90, 16),
            BackgroundTransparency = 1,
            Font = DEFAULT_FONT,
            Text = searchable and "SEARCH + SELECT" or (multi and "MULTI" or "SELECT"),
            TextSize = 8,
            TextXAlignment = Enum.TextXAlignment.Right,
            ZIndex = 401,
            Parent = popup,
        })
        self.Window:_paint(popupMode, "TextColor3", "Muted")

        local searchBox
        if searchable then
            local searchBack = create("Frame", {
                Name = "SearchBack",
                Position = UDim2.fromOffset(12, 34),
                Size = UDim2.new(1, -24, 0, 29),
                BorderSizePixel = 0,
                ZIndex = 401,
                Parent = popup,
            })
            addCorner(searchBack, 8)
            local searchStroke = addStroke(searchBack, self.Window.Theme.Border, 0.4, 1)
            self.Window:_paint(searchBack, "BackgroundColor3", "Background")
            self.Window:_paint(searchStroke, "Color", "Border")

            local searchIcon = self.Window:_makeIcon(searchBack, "search", 13, "Muted")
            searchIcon.AnchorPoint = Vector2.new(0, 0.5)
            searchIcon.Position = UDim2.new(0, 9, 0.5, 0)
            searchIcon.ZIndex = 402

            searchBox = create("TextBox", {
                Name = "Search",
                BackgroundTransparency = 1,
                Position = UDim2.fromOffset(30, 0),
                Size = UDim2.new(1, -38, 1, 0),
                ClearTextOnFocus = false,
                Font = DEFAULT_FONT,
                PlaceholderText = "Search options",
                Text = "",
                TextSize = 10,
                TextXAlignment = Enum.TextXAlignment.Left,
                ZIndex = 402,
                Parent = searchBack,
            })
            self.Window:_paint(searchBox, "TextColor3", "Text")
            self.Window:_paint(searchBox, "PlaceholderColor3", "Muted")
        end

        local popupDivider = create("Frame", {
            Name = "Divider",
            Position = UDim2.fromOffset(12, searchable and 69 or 31),
            Size = UDim2.new(1, -24, 0, 1),
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            ZIndex = 401,
            Parent = popup,
        })
        self.Window:_paint(popupDivider, "BackgroundColor3", "Border")

        local scroll = create("ScrollingFrame", {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(8, searchable and 76 or 38),
            Size = UDim2.new(1, -16, 1, -(searchable and 84 or 46)),
            BorderSizePixel = 0,
            CanvasSize = UDim2.fromOffset(0, #control.Values * optionHeight + 4),
            ScrollBarThickness = 0,
            ScrollBarImageTransparency = 1,
            ZIndex = 401,
            Parent = popup,
        })
        self.Window:_paint(scroll, "ScrollBarImageColor3", "Accent")
        local optionLayout = create("UIListLayout", {
            Padding = UDim.new(0, 4),
            SortOrder = Enum.SortOrder.LayoutOrder,
            Parent = scroll,
        })

        local optionRows = {}
        local emptyLabel = create("TextLabel", {
            Name = "Empty",
            Visible = false,
            Position = UDim2.fromOffset(12, searchable and 84 or 48),
            Size = UDim2.new(1, -24, 0, 22),
            BackgroundTransparency = 1,
            Font = DEFAULT_FONT,
            Text = "No options found",
            TextSize = 10,
            TextXAlignment = Enum.TextXAlignment.Center,
            ZIndex = 404,
            Parent = popup,
        })
        self.Window:_paint(emptyLabel, "TextColor3", "Muted")

        self.Window:_connect(optionLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
            scroll.CanvasSize = UDim2.fromOffset(0, optionLayout.AbsoluteContentSize.Y + 4)
        end)

        for _, value in ipairs(control.Values) do
            local selected = multi and arrayContains(control.Value, value) or control.Value == value
            local optionButton = create("TextButton", {
                Name = tostring(value),
                Size = UDim2.new(1, -4, 0, 30),
                BorderSizePixel = 0,
                BackgroundTransparency = selected and 0.08 or 1,
                AutoButtonColor = false,
                Active = true,
                Text = "",
                ZIndex = 402,
                Parent = scroll,
            })
            addCorner(optionButton, 8)
            optionButton.BackgroundColor3 = mix(self.Window.Theme.AccentDark, self.Window.Theme.Topbar, 0.58)

            local optionLabel = create("TextLabel", {
                Name = "Label",
                BackgroundTransparency = 1,
                Position = UDim2.fromOffset(24, 0),
                Size = UDim2.new(1, -58, 1, 0),
                Font = DEFAULT_FONT,
                Text = tostring(value),
                TextSize = 10,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextTruncate = Enum.TextTruncate.AtEnd,
                ZIndex = 403,
                Parent = optionButton,
            })
            optionLabel.TextColor3 = selected and self.Window.Theme.Text or self.Window.Theme.Muted

            local marker = create("Frame", {
                Name = "Marker",
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.new(0, 10, 0.5, 0),
                Size = UDim2.fromOffset(6, 6),
                BorderSizePixel = 0,
                BackgroundColor3 = selected and self.Window.Theme.Accent or self.Window.Theme.Border,
                ZIndex = 403,
                Parent = optionButton,
            })
            addCorner(marker, 3)

            local checkIcon = newIcon(optionButton, "check", 13, self.Window.Theme.Accent)
            checkIcon.AnchorPoint = Vector2.new(1, 0.5)
            checkIcon.Position = UDim2.new(1, -9, 0.5, 0)
            checkIcon.Visible = selected
            checkIcon.ZIndex = 403
            local optionScale = create("UIScale", {
                Scale = 1,
                Parent = optionButton,
            })
            table.insert(optionRows, {
                Button = optionButton,
                Value = string.lower(tostring(value)),
            })

            local optionSelected = false
            local lastSelectionTime = 0
            local function selectOption()
                if (not multi and optionSelected) or (multi and os.clock() - lastSelectionTime < 0.1) then
                    return
                end
                lastSelectionTime = os.clock()
                if not multi then
                    optionSelected = true
                end
                if multi then
                    local nextSelection = copyArray(control.Value)
                    local found, index = arrayContains(nextSelection, value)
                    if found then
                        table.remove(nextSelection, index)
                    else
                        table.insert(nextSelection, value)
                    end
                    control:SetValue(nextSelection)
                    local nowSelected = arrayContains(control.Value, value)
                    checkIcon.Visible = nowSelected
                    marker.BackgroundColor3 = nowSelected and self.Window.Theme.Accent or self.Window.Theme.Border
                    optionButton.BackgroundTransparency = nowSelected and 0.08 or 1
                    optionLabel.TextColor3 = nowSelected and self.Window.Theme.Text or self.Window.Theme.Muted
                else
                    control:SetValue(value)
                    self.Window:_closePopup()
                end
            end
            self.Window:_connect(optionButton.Activated, selectOption)
            self.Window:_connect(optionButton.MouseButton1Click, selectOption)
            self.Window:_connect(optionButton.InputBegan, function(input)
                local inputType = input.UserInputType
                if inputType == Enum.UserInputType.MouseButton1 or inputType == Enum.UserInputType.Touch then
                    selectOption()
                end
            end)
            self.Window:_connect(optionButton.MouseEnter, function()
                tween(optionButton, {
                    BackgroundTransparency = 0.08,
                    BackgroundColor3 = self.Window.Theme.Control,
                })
                tween(optionLabel, { TextColor3 = self.Window.Theme.Text })
                tween(optionScale, { Scale = 1.012 }, TWEEN_FAST)
            end)
            self.Window:_connect(optionButton.MouseLeave, function()
                local nowSelected = multi and arrayContains(control.Value, value) or control.Value == value
                tween(optionButton, {
                    BackgroundTransparency = nowSelected and 0.08 or 1,
                    BackgroundColor3 = mix(self.Window.Theme.AccentDark, self.Window.Theme.Topbar, 0.58),
                })
                tween(optionLabel, { TextColor3 = nowSelected and self.Window.Theme.Text or self.Window.Theme.Muted })
                tween(optionScale, { Scale = 1 }, TWEEN_FAST)
            end)
        end

        local function applyFilter(query)
            local normalized = string.lower(trim(query or ""))
            local matches = 0
            for _, option in ipairs(optionRows) do
                local visible = normalized == ""
                    or string.find(option.Value, normalized, 1, true) ~= nil
                option.Button.Visible = visible
                if visible then
                    matches = matches + 1
                end
            end
            emptyLabel.Visible = matches == 0
            scroll.CanvasPosition = Vector2.new(0, 0)
        end

        if searchBox then
            self.Window:_connect(searchBox:GetPropertyChangedSignal("Text"), function()
                applyFilter(searchBox.Text)
            end)
        end

        arrow.Image = resolveIcon("chevron-down")
        tween(arrow, { Rotation = 180 }, TWEEN_FAST)
        popup.Destroying:Once(function()
            popup = nil
            if arrow.Parent then
                arrow.Rotation = 0
            end
        end)
        self.Window:_openPopup(popup, row)
        tween(popup, { BackgroundTransparency = 0 }, TWEEN_FAST)
        tween(popupStroke, { Transparency = 0.18 }, TWEEN_FAST)
        tween(popupScale, { Scale = 1 }, TWEEN_POP)
    end

    self.Window:_connect(row.Activated, openDropdown)
    refresh()
    return control
end

function Section:AddInput(options)
    options = options or {}
    local inputWidth = math.clamp(tonumber(options.Width) or 100, 88, 180)
    local row, title, description = self:_makeRow(options, options.Description and 64 or 50, false)
    local numeric = options.Numeric == true
    local default = options.Default
    if default == nil then
        default = ""
    end

    local control = self:_prepareControl(options, {
        Type = "Input",
        Value = numeric and (tonumber(default) or 0) or tostring(default),
    }, row, title)
    local titleOffset = options.Icon and 39 or 13
    title.Size = UDim2.new(1, -(titleOffset + inputWidth + 16), options.Description and 0 or 1, options.Description and 20 or 0)
    if description then
        description.Size = UDim2.new(1, -(titleOffset + inputWidth + 16), 0, 18)
    end

    local inputBack = create("Frame", {
        Name = "InputBack",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -12, 0.5, 0),
        Size = UDim2.fromOffset(inputWidth, 30),
        BorderSizePixel = 0,
        Parent = row,
    })
    addCorner(inputBack, 9)
    local inputStroke = addStroke(inputBack, self.Window.Theme.Border, 0.25, 1)
    self.Window:_paint(inputBack, "BackgroundColor3", "Background")
    self.Window:_paint(inputStroke, "Color", "Border")

    local textBox = create("TextBox", {
        Name = "Input",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(10, 0),
        Size = UDim2.new(1, -20, 1, 0),
        ClearTextOnFocus = options.ClearOnFocus == true,
        Font = DEFAULT_FONT,
        PlaceholderText = options.Placeholder or "Enter value",
        Text = tostring(control.Value),
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = inputBack,
    })
    self.Window:_paint(textBox, "TextColor3", "Text")
    self.Window:_paint(textBox, "PlaceholderColor3", "Muted")

    local updating = false
    function control:SetValue(value, silent)
        local nextValue
        if numeric then
            nextValue = tonumber(value)
            if not nextValue then
                return self
            end
            if options.Min then
                nextValue = math.max(nextValue, options.Min)
            end
            if options.Max then
                nextValue = math.min(nextValue, options.Max)
            end
        else
            nextValue = tostring(value or "")
        end

        self.Value = nextValue
        updating = true
        textBox.Text = tostring(nextValue)
        updating = false
        if not silent then
            self:_emit(self.Value)
        end
        return self
    end

    self.Window:_connect(textBox.Focused, function()
        tween(inputStroke, { Color = self.Window.Theme.Accent, Transparency = 0 })
    end)
    self.Window:_connect(textBox.FocusLost, function(enterPressed)
        tween(inputStroke, { Color = self.Window.Theme.Border, Transparency = 0.25 })
        control:SetValue(textBox.Text)
        if options.OnEnter and enterPressed then
            safeCallback(options.OnEnter, control.Value)
        end
    end)

    if options.Finished == false then
        self.Window:_connect(textBox:GetPropertyChangedSignal("Text"), function()
            if not updating then
                control:SetValue(textBox.Text)
            end
        end)
    end

    control.TextBox = textBox
    return control
end

local function keyName(value)
    if typeof(value) ~= "EnumItem" then
        return "None"
    end

    local name = value.Name
    local aliases = {
        LeftControl = "LControl",
        RightControl = "RControl",
        LeftShift = "LShift",
        RightShift = "RShift",
        LeftAlt = "LAlt",
        RightAlt = "RAlt",
        Backquote = "`",
    }
    return aliases[name] or name
end

function Section:AddKeybind(options)
    options = options or {}
    local bindWidth = math.clamp(tonumber(options.Width) or 88, 78, 150)
    local row, title, description = self:_makeRow(options, options.Description and 64 or 50, false)
    local default = options.Default
    if type(default) == "string" then
        default = Enum.KeyCode[default]
    end
    if typeof(default) ~= "EnumItem" then
        default = Enum.KeyCode.Unknown
    end

    local control = self:_prepareControl(options, {
        Type = "Keybind",
        Value = default,
    }, row, title)
    local titleOffset = options.Icon and 39 or 13
    title.Size = UDim2.new(1, -(titleOffset + bindWidth + 16), options.Description and 0 or 1, options.Description and 20 or 0)
    if description then
        description.Size = UDim2.new(1, -(titleOffset + bindWidth + 16), 0, 18)
    end

    local bindButton = create("TextButton", {
        Name = "Bind",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -12, 0.5, 0),
        Size = UDim2.fromOffset(bindWidth, 30),
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Font = SEMIBOLD_FONT,
        Text = keyName(control.Value),
        TextSize = 10,
        Parent = row,
    })
    addCorner(bindButton, 9)
    local bindStroke = addStroke(bindButton, self.Window.Theme.Border, 0.25, 1)
    self.Window:_paint(bindButton, "BackgroundColor3", "Background")
    self.Window:_paint(bindButton, "TextColor3", "Muted")
    self.Window:_paint(bindStroke, "Color", "Border")

    local capturing = false
    function control:SetValue(value, silent)
        if type(value) == "string" then
            value = Enum.KeyCode[value]
        end
        if typeof(value) ~= "EnumItem" then
            value = Enum.KeyCode.Unknown
        end

        self.Value = value
        bindButton.Text = keyName(value)
        if not silent then
            self._changed:Fire(value)
            self.Window:_queueConfigSave()
            safeCallback(options.Changed, value)
        end
        return self
    end

    self.Window:_connect(bindButton.Activated, function()
        capturing = true
        bindButton.Text = "..."
        tween(bindStroke, { Color = self.Window.Theme.Accent, Transparency = 0 })
    end)

    self.Window:_connect(UserInputService.InputBegan, function(input, gameProcessed)
        if capturing then
            if input.UserInputType ~= Enum.UserInputType.Keyboard then
                return
            end

            capturing = false
            tween(bindStroke, { Color = self.Window.Theme.Border, Transparency = 0.25 })
            if input.KeyCode == Enum.KeyCode.Escape then
                bindButton.Text = keyName(control.Value)
            elseif input.KeyCode == Enum.KeyCode.Backspace then
                control:SetValue(Enum.KeyCode.Unknown)
            else
                control:SetValue(input.KeyCode)
            end
            return
        end

        if not gameProcessed
            and control.Value ~= Enum.KeyCode.Unknown
            and input.KeyCode == control.Value
        then
            safeCallback(options.Callback, input.KeyCode)
        end
    end)

    self.Window:_registerKeybind(control, options, bindButton)
    return control
end

function Section:AddColorPicker(options)
    options = options or {}
    local initial = hexToColor(options.Default) or Color3.fromRGB(181, 72, 255)
    local row, title, description = self:_makeRow(options, options.Description and 64 or 50, true)
    local control = self:_prepareControl(options, {
        Type = "ColorPicker",
        Value = initial,
    }, row, title)
    local titleOffset = options.Icon and 39 or 13
    title.Size = UDim2.new(1, -(titleOffset + 118), options.Description and 0 or 1, options.Description and 20 or 0)
    if description then
        description.Size = UDim2.new(1, -(titleOffset + 118), 0, 18)
    end

    local valueLabel = create("TextLabel", {
        Name = "Hex",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -46, 0.5, 0),
        Size = UDim2.fromOffset(68, 22),
        BackgroundTransparency = 1,
        Font = DEFAULT_FONT,
        Text = colorToHex(initial),
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Right,
        Parent = row,
    })
    self.Window:_paint(valueLabel, "TextColor3", "Muted")

    local swatch = create("Frame", {
        Name = "Swatch",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -13, 0.5, 0),
        Size = UDim2.fromOffset(26, 26),
        BorderSizePixel = 0,
        BackgroundColor3 = initial,
        Parent = row,
    })
    addCorner(swatch, 8)
    local swatchStroke = addStroke(swatch, self.Window.Theme.Border, 0.15, 1)
    self.Window:_paint(swatchStroke, "Color", "Border")

    local hue, saturation, brightness = Color3.toHSV(initial)
    local popup
    local saturationField
    local saturationSelector
    local hueSelector
    local draggingSaturation = false
    local draggingHue = false

    local function refresh()
        swatch.BackgroundColor3 = control.Value
        valueLabel.Text = colorToHex(control.Value)
        if saturationField and saturationField.Parent then
            saturationField.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
            saturationSelector.Position = UDim2.fromScale(saturation, 1 - brightness)
            hueSelector.Position = UDim2.new(hue, 0, 0.5, 0)
        end
    end

    function control:SetValue(value, silent)
        local color = hexToColor(value)
        if not color then
            return self
        end

        self.Value = color
        hue, saturation, brightness = Color3.toHSV(color)
        refresh()
        if not silent then
            self:_emit(color)
        end
        return self
    end

    local function setSaturationFromPoint(point)
        if not saturationField or not saturationField.Parent then
            return
        end
        local position = saturationField.AbsolutePosition
        local size = saturationField.AbsoluteSize
        saturation = math.clamp((point.X - position.X) / math.max(size.X, 1), 0, 1)
        brightness = 1 - math.clamp((point.Y - position.Y) / math.max(size.Y, 1), 0, 1)
        control.Value = Color3.fromHSV(hue, saturation, brightness)
        refresh()
        control:_emit(control.Value)
    end

    local function setHueFromPoint(point, hueBar)
        local position = hueBar.AbsolutePosition
        local size = hueBar.AbsoluteSize
        hue = math.clamp((point.X - position.X) / math.max(size.X, 1), 0, 1)
        control.Value = Color3.fromHSV(hue, saturation, brightness)
        refresh()
        control:_emit(control.Value)
    end

    local function openPicker()
        if popup and popup.Parent then
            self.Window:_closePopup()
            return
        end
        self.Window:_closePopup()

        local rowPosition = row.AbsolutePosition
        local rowSize = row.AbsoluteSize
        local viewport = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1920, 1080)
        local width = 230
        local height = 196
        local maxX = math.max(8, viewport.X - width - 8)
        local x = math.clamp(rowPosition.X + rowSize.X - width, 8, maxX)
        local y = rowPosition.Y + rowSize.Y + 5
        if y + height > viewport.Y - 8 then
            y = rowPosition.Y - height - 5
        end
        y = math.max(8, y)

        popup = create("Frame", {
            Name = "ColorPopup",
            Position = UDim2.fromOffset(x, y),
            Size = UDim2.fromOffset(width, height),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 400,
        })
        addCorner(popup, 11)
        local popupStroke = addStroke(popup, self.Window.Theme.Border, 1, 1)
        self.Window:_paint(popup, "BackgroundColor3", "Topbar")
        self.Window:_paint(popupStroke, "Color", "Border")
        local popupScale = create("UIScale", {
            Scale = 0.96,
            Parent = popup,
        })

        local popupTitle = create("TextLabel", {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(12, 7),
            Size = UDim2.new(1, -24, 0, 22),
            Font = SEMIBOLD_FONT,
            Text = options.Title or "Color",
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 401,
            Parent = popup,
        })
        self.Window:_paint(popupTitle, "TextColor3", "Text")

        saturationField = create("Frame", {
            Name = "Saturation",
            Position = UDim2.fromOffset(12, 34),
            Size = UDim2.new(1, -24, 0, 104),
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromHSV(hue, 1, 1),
            ZIndex = 401,
            Parent = popup,
        })
        addCorner(saturationField, 8)

        local whiteOverlay = create("Frame", {
            BackgroundColor3 = Color3.new(1, 1, 1),
            Size = UDim2.fromScale(1, 1),
            BorderSizePixel = 0,
            ZIndex = 402,
            Parent = saturationField,
        })
        addCorner(whiteOverlay, 8)
        create("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(1, 1),
            }),
            Parent = whiteOverlay,
        })

        local blackOverlay = create("Frame", {
            BackgroundColor3 = Color3.new(0, 0, 0),
            Size = UDim2.fromScale(1, 1),
            BorderSizePixel = 0,
            ZIndex = 403,
            Parent = saturationField,
        })
        addCorner(blackOverlay, 8)
        create("UIGradient", {
            Rotation = 90,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(1, 0),
            }),
            Parent = blackOverlay,
        })

        local saturationHitbox = create("TextButton", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Text = "",
            ZIndex = 405,
            Parent = saturationField,
        })

        saturationSelector = create("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(saturation, 1 - brightness),
            Size = UDim2.fromOffset(12, 12),
            BackgroundTransparency = 1,
            ZIndex = 406,
            Parent = saturationField,
        })
        addCorner(saturationSelector, 6)
        addStroke(saturationSelector, Color3.new(1, 1, 1), 0, 2)

        local hueBar = create("Frame", {
            Name = "Hue",
            Position = UDim2.fromOffset(12, 148),
            Size = UDim2.new(1, -24, 0, 12),
            BorderSizePixel = 0,
            ZIndex = 401,
            Parent = popup,
        })
        addCorner(hueBar, 7)
        create("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 1, 1)),
                ColorSequenceKeypoint.new(0.17, Color3.fromHSV(0.17, 1, 1)),
                ColorSequenceKeypoint.new(0.33, Color3.fromHSV(0.33, 1, 1)),
                ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.5, 1, 1)),
                ColorSequenceKeypoint.new(0.67, Color3.fromHSV(0.67, 1, 1)),
                ColorSequenceKeypoint.new(0.83, Color3.fromHSV(0.83, 1, 1)),
                ColorSequenceKeypoint.new(1, Color3.fromHSV(1, 1, 1)),
            }),
            Parent = hueBar,
        })

        local hueHitbox = create("TextButton", {
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 0, 0, -4),
            Size = UDim2.new(1, 0, 1, 8),
            Text = "",
            ZIndex = 405,
            Parent = hueBar,
        })

        hueSelector = create("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(hue, 0, 0.5, 0),
            Size = UDim2.fromOffset(5, 18),
            BackgroundColor3 = Color3.new(1, 1, 1),
            BorderSizePixel = 0,
            ZIndex = 406,
            Parent = hueBar,
        })
        addCorner(hueSelector, 3)
        addStroke(hueSelector, Color3.new(0, 0, 0), 0.35, 1)

        local hexLabel = create("TextLabel", {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(12, 165),
            Size = UDim2.new(1, -24, 0, 18),
            Font = DEFAULT_FONT,
            Text = colorToHex(control.Value),
            TextSize = 10,
            TextXAlignment = Enum.TextXAlignment.Right,
            ZIndex = 401,
            Parent = popup,
        })
        self.Window:_paint(hexLabel, "TextColor3", "Muted")
        control:OnChanged(function(value)
            if hexLabel.Parent then
                hexLabel.Text = colorToHex(value)
            end
        end)

        self.Window:_connect(saturationHitbox.InputBegan, function(input)
            local inputType = input.UserInputType
            if inputType == Enum.UserInputType.MouseButton1 or inputType == Enum.UserInputType.Touch then
                draggingSaturation = true
                setSaturationFromPoint(input.Position)
            end
        end)
        self.Window:_connect(hueHitbox.InputBegan, function(input)
            local inputType = input.UserInputType
            if inputType == Enum.UserInputType.MouseButton1 or inputType == Enum.UserInputType.Touch then
                draggingHue = true
                setHueFromPoint(input.Position, hueBar)
            end
        end)

        popup.Destroying:Once(function()
            draggingSaturation = false
            draggingHue = false
            saturationField = nil
            saturationSelector = nil
            hueSelector = nil
            popup = nil
        end)
        self.Window:_openPopup(popup, row)
        tween(popup, { BackgroundTransparency = 0 }, TWEEN_FAST)
        tween(popupStroke, { Transparency = 0.18 }, TWEEN_FAST)
        tween(popupScale, { Scale = 1 }, TWEEN_POP)
        refresh()
    end

    self.Window:_connect(UserInputService.InputChanged, function(input)
        local inputType = input.UserInputType
        if draggingSaturation and (inputType == Enum.UserInputType.MouseMovement
            or inputType == Enum.UserInputType.Touch)
        then
            setSaturationFromPoint(input.Position)
        elseif draggingHue and (inputType == Enum.UserInputType.MouseMovement
            or inputType == Enum.UserInputType.Touch)
        then
            local hueBar = hueSelector and hueSelector.Parent
            if hueBar then
                setHueFromPoint(input.Position, hueBar)
            end
        end
    end)
    self.Window:_connect(UserInputService.InputEnded, function(input)
        local inputType = input.UserInputType
        if inputType == Enum.UserInputType.MouseButton1 or inputType == Enum.UserInputType.Touch then
            draggingSaturation = false
            draggingHue = false
        end
    end)
    self.Window:_connect(row.Activated, openPicker)
    refresh()
    return control
end

function Section:AddParagraph(options)
    options = type(options) == "table" and options or { Content = tostring(options) }
    local content = tostring(options.Content or options.Description or "")
    local row, title = self:_makeRow({
        Title = options.Title or "Information",
        Icon = options.Icon or "info",
    }, 70, false)
    local rowIcon = row:FindFirstChild("Icon")
    if rowIcon then
        rowIcon.Position = UDim2.new(0, 14, 0, 17)
    end
    title.Size = UDim2.new(1, -56, 0, 22)
    title.Position = UDim2.fromOffset(43, 8)

    local contentLabel = create("TextLabel", {
        Name = "Content",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(14, 37),
        Size = UDim2.new(1, -28, 0, 18),
        AutomaticSize = Enum.AutomaticSize.Y,
        Font = options.Monospace and Enum.Font.RobotoMono or self.Window.Fonts.Regular,
        Text = content,
        TextSize = 11,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        Parent = row,
    })
    if options.Monospace then
        contentLabel:SetAttribute("MytrahFontLocked", true)
        contentLabel.Font = Enum.Font.RobotoMono
    end
    self.Window:_paint(contentLabel, "TextColor3", "Muted")

    local control = self:_prepareControl(options, {
        Type = "Paragraph",
        Value = content,
    }, row, title)

    local resizePending = false
    local function updateHeight()
        if resizePending or not row.Parent then
            return
        end
        resizePending = true
        task.defer(function()
            resizePending = false
            if not row.Parent then
                return
            end
            local contentHeight = math.max(contentLabel.TextBounds.Y, contentLabel.AbsoluteSize.Y)
            row.Size = UDim2.new(1, 0, 0, math.max(70, contentHeight + 52))
            self:_updateSize()
        end)
    end

    self.Window:_connect(contentLabel:GetPropertyChangedSignal("TextBounds"), updateHeight)
    self.Window:_connect(contentLabel:GetPropertyChangedSignal("AbsoluteSize"), updateHeight)

    function control:SetValue(value)
        self.Value = tostring(value or "")
        contentLabel.Text = self.Value
        updateHeight()
        return self
    end

    function control:SetContent(value)
        return self:SetValue(value)
    end

    updateHeight()

    return control
end

function Section:AddLabel(options)
    if type(options) ~= "table" then
        options = { Title = "Label", Content = tostring(options) }
    end
    return self:AddParagraph(options)
end

function Section:AddDivider(title)
    self._layoutOrder = self._layoutOrder + 1
    local holder = create("Frame", {
        Name = "Divider",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, title and 26 or 14),
        LayoutOrder = self._layoutOrder,
        Parent = self.Body,
    })
    local line = create("Frame", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 0, 0.5, 0),
        Size = UDim2.new(1, 0, 0, 1),
        BorderSizePixel = 0,
        Parent = holder,
    })
    self.Window:_paint(line, "BackgroundColor3", "Border")

    if title then
        local label = create("TextLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(math.min(#tostring(title) * 7 + 20, 180), 20),
            BorderSizePixel = 0,
            Font = SEMIBOLD_FONT,
            Text = string.upper(tostring(title)),
            TextSize = 8,
            Parent = holder,
        })
        addCorner(label, 5)
        self.Window:_paint(label, "BackgroundColor3", "Section")
        self.Window:_paint(label, "TextColor3", "Muted")
    end

    local handle = { Instance = holder }
    function handle:SetVisible(visible)
        holder.Visible = visible == true
        return self
    end
    function handle:Destroy()
        holder:Destroy()
    end
    return handle
end

local function flattenDialogDetails(details, groups)
    local result = type(details) == "table" and copyArray(details) or {}
    if type(groups) ~= "table" or #groups == 0 then
        return result
    end

    result = {}
    for _, group in ipairs(groups) do
        local groupDetails = type(group.Details) == "table" and group.Details or {}
        if group.Title then
            table.insert(result, {
                _group = true,
                Label = tostring(group.Title),
                Icon = group.Icon,
            })
        end
        for _, detail in ipairs(groupDetails) do
            table.insert(result, detail)
        end
    end
    return result
end

function Window:Dialog(options)
    options = options or {}
    self:_closePopup()

    local overlay = create("TextButton", {
        Name = "DialogOverlay",
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.new(0, 0, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Modal = true,
        Text = "",
        ZIndex = 450,
        Parent = self.ScreenGui,
    })

    local buttons = options.Buttons or {
        { Title = "Close" },
    }
    local inputs = type(options.Inputs) == "table" and options.Inputs or {}
    local details = flattenDialogDetails(options.Details, options.Groups)
    local dialogTabs = {}
    if type(options.Tabs) == "table" then
        for index, tabOptions in ipairs(options.Tabs) do
            table.insert(dialogTabs, {
                Title = tostring(tabOptions.Title or ("Tab " .. index)),
                Icon = tabOptions.Icon or "circle",
                Details = flattenDialogDetails(tabOptions.Details, tabOptions.Groups),
            })
        end
    end
    local hasTabs = #dialogTabs > 0
    local maximumDetailCount = #details
    if hasTabs then
        details = dialogTabs[1].Details
        maximumDetailCount = 0
        for _, tabData in ipairs(dialogTabs) do
            maximumDetailCount = math.max(maximumDetailCount, #tabData.Details)
        end
    end
    local contentText = tostring(options.Content or options.Description or "")
    local hasInputs = #inputs > 0
    local hasDetails = maximumDetailCount > 0
    local hasContent = contentText ~= ""
    local detailRowHeight = 36
    local inputRowHeight = 42
    local inputGap = 8
    local tabBarHeight = hasTabs and 42 or 0
    local bodyTop = 70 + tabBarHeight
    local detailsTop = hasContent and (bodyTop + 40) or (bodyTop + 6)
    local detailsHeight = maximumDetailCount * detailRowHeight
    local inputTop = hasDetails and (detailsTop + detailsHeight + 10)
        or (hasContent and (bodyTop + 40) or (bodyTop + 6))
    local inputHeight = #inputs * inputRowHeight + math.max(#inputs - 1, 0) * inputGap
    local bodyBottom = hasInputs and (inputTop + inputHeight)
        or hasDetails and (detailsTop + detailsHeight)
        or (bodyTop + 64)
    local statusSpace = hasInputs and 24 or 0
    local naturalDialogHeight = options.Height or ((hasInputs or hasDetails) and (bodyBottom + 70 + statusSpace) or 204)
    local viewport = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1920, 1080)
    local dialogWidth = math.min(math.max(280, tonumber(options.Width) or 390), math.max(280, viewport.X - 24))
    local dialogHeight = math.min(naturalDialogHeight, math.max(220, viewport.Y - 24))
    local fitScale = math.min(1, (viewport.X - 24) / dialogWidth, (viewport.Y - 24) / dialogHeight)
    fitScale = math.max(0.45, fitScale)
    local handle = { Values = {}, Inputs = {} }
    local card = create("CanvasGroup", {
        Name = "Dialog",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(dialogWidth, dialogHeight),
        GroupTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 451,
        Parent = overlay,
    })
    addCorner(card, 18)
    handle.Instance = card
    local cardStroke = addStroke(card, self.Theme.Border, 0.18, 1)
    self:_paint(card, "BackgroundColor3", "Topbar")
    self:_paint(cardStroke, "Color", "Border")

    local dialogColor = options.Type == "Error" and "Danger"
        or options.Type == "Warning" and "Warning"
        or options.Type == "Success" and "Success"
        or "AccentDark"

    local iconBack = create("Frame", {
        Position = UDim2.fromOffset(18, 18),
        Size = UDim2.fromOffset(42, 42),
        BackgroundTransparency = 0.12,
        BorderSizePixel = 0,
        ZIndex = 452,
        Parent = card,
    })
    addCorner(iconBack, 13)
    self:_paint(iconBack, "BackgroundColor3", dialogColor)

    local dialogIcon = self:_makeIcon(iconBack, options.Icon or "info", 17,
        (options.Type == "Error" or options.Type == "Warning") and "Text" or "Accent")
    dialogIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    dialogIcon.Position = UDim2.fromScale(0.5, 0.5)
    dialogIcon.ZIndex = 453

    local avatarImage = options.Avatar
    local avatarUserId = tonumber(options.AvatarUserId)
    if not avatarImage and avatarUserId and avatarUserId > 0 then
        avatarImage = string.format("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150", avatarUserId)
    end
    if type(avatarImage) == "string" and avatarImage ~= "" then
        dialogIcon.Visible = false
        local dialogAvatar = create("ImageLabel", {
            Name = "Avatar",
            BackgroundTransparency = 1,
            Image = avatarImage,
            Size = UDim2.fromScale(1, 1),
            ZIndex = 453,
            Parent = iconBack,
        })
        addCorner(dialogAvatar, 13)
    end

    local closeButton = create("ImageButton", {
        Name = "DialogClose",
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -16, 0, 16),
        Size = UDim2.fromOffset(28, 28),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutoButtonColor = false,
        ImageTransparency = 1,
        ZIndex = 454,
        Parent = card,
    })
    addCorner(closeButton, 9)
    local closeImage = self:_makeIcon(closeButton, "x", 13, "Muted")
    closeImage.AnchorPoint = Vector2.new(0.5, 0.5)
    closeImage.Position = UDim2.fromScale(0.5, 0.5)
    closeImage.ZIndex = 455

    local title = create("TextLabel", {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(68, 17),
        Size = UDim2.new(1, -120, 0, 24),
        Font = SEMIBOLD_FONT,
        Text = options.Title or "Dialog",
        TextSize = 18,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        ZIndex = 452,
        Parent = card,
    })
    self:_paint(title, "TextColor3", "Text")

    local subtitle = create("TextLabel", {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(68, 41),
        Size = UDim2.new(1, -120, 0, 18),
        Font = DEFAULT_FONT,
        Text = options.Subtitle or "Mytrah",
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        ZIndex = 452,
        Parent = card,
    })
    self:_paint(subtitle, "TextColor3", "Muted")

    local dialogTabButtons = {}
    if hasTabs then
        local tabBar = create("Frame", {
            Name = "DialogTabs",
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(18, 70),
            Size = UDim2.new(1, -36, 0, 34),
            ZIndex = 453,
            Parent = card,
        })
        local tabGap = 6
        local tabWidth = math.floor((dialogWidth - 36 - (#dialogTabs - 1) * tabGap) / #dialogTabs)
        for index, tabData in ipairs(dialogTabs) do
            local tabButton = create("TextButton", {
                Name = "DialogTab_" .. tabData.Title,
                Position = UDim2.fromOffset((index - 1) * (tabWidth + tabGap), 0),
                Size = UDim2.fromOffset(tabWidth, 34),
                BackgroundTransparency = 0.45,
                BorderSizePixel = 0,
                AutoButtonColor = false,
                Text = "",
                ZIndex = 454,
                Parent = tabBar,
            })
            addCorner(tabButton, 10)
            self:_paint(tabButton, "BackgroundColor3", "Control")

            local tabIcon = self:_makeIcon(tabButton, tabData.Icon, 13, "Muted")
            tabIcon.AnchorPoint = Vector2.new(0, 0.5)
            tabIcon.Position = UDim2.new(0, 11, 0.5, 0)
            tabIcon.ZIndex = 455
            local tabLabel = create("TextLabel", {
                BackgroundTransparency = 1,
                Position = UDim2.fromOffset(31, 0),
                Size = UDim2.new(1, -40, 1, 0),
                Font = SEMIBOLD_FONT,
                Text = tabData.Title,
                TextSize = 11,
                TextTruncate = Enum.TextTruncate.AtEnd,
                TextXAlignment = Enum.TextXAlignment.Left,
                ZIndex = 455,
                Parent = tabButton,
            })
            self:_paint(tabLabel, "TextColor3", "Muted")
            table.insert(dialogTabButtons, {
                Button = tabButton,
                Icon = tabIcon,
                Label = tabLabel,
            })
        end
    end

    local bodyHeight = math.max(70, dialogHeight - bodyTop - 62)
    local bodyScroll = create("ScrollingFrame", {
        Name = "Body",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(18, bodyTop),
        Size = UDim2.new(1, -36, 0, bodyHeight),
        BorderSizePixel = 0,
        CanvasSize = UDim2.fromOffset(0, math.max(bodyHeight, bodyBottom - bodyTop + 8)),
        ScrollBarThickness = 2,
        ScrollBarImageTransparency = 0.35,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ZIndex = 452,
        Parent = card,
    })
    self:_paint(bodyScroll, "ScrollBarImageColor3", "Accent")

    local content = create("TextLabel", {
        BackgroundTransparency = 1,
        Visible = hasContent,
        Position = UDim2.fromOffset(0, 4),
        Size = (hasInputs or hasDetails) and UDim2.new(1, 0, 0, 28) or UDim2.new(1, -8, 0, math.max(28, bodyHeight - 8)),
        Font = DEFAULT_FONT,
        Text = contentText,
        TextSize = 12,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        ZIndex = 452,
        Parent = bodyScroll,
    })
    self:_paint(content, "TextColor3", "Muted")

    local detailFrames = {}
    local function createDetailsPage(detailList, pageIndex)
        if #detailList == 0 then
            return nil
        end
        local detailsHolder = create("Frame", {
            Name = "Details_" .. tostring(pageIndex),
            Visible = pageIndex == 1,
            Position = UDim2.fromOffset(0, detailsTop - bodyTop),
            Size = UDim2.new(1, -4, 0, #detailList * detailRowHeight),
            BorderSizePixel = 0,
            ZIndex = 452,
            Parent = bodyScroll,
        })
        addCorner(detailsHolder, 10)
        local detailsStroke = addStroke(detailsHolder, self.Theme.Border, 0.35, 1)
        self:_paint(detailsHolder, "BackgroundColor3", "Control")
        self:_paint(detailsStroke, "Color", "Border")

        for index, detail in ipairs(detailList) do
            local row = create("Frame", {
                Name = "Detail_" .. tostring(index),
                Position = UDim2.fromOffset(0, (index - 1) * detailRowHeight),
                Size = UDim2.new(1, 0, 0, detailRowHeight),
                BackgroundTransparency = 1,
                ZIndex = 453,
                Parent = detailsHolder,
            })
            if detail._group then
                row.BackgroundTransparency = 0.72
                self:_paint(row, "BackgroundColor3", "AccentDark")
            end
            local detailLabel = create("TextLabel", {
                BackgroundTransparency = 1,
                Position = UDim2.fromOffset(11, 0),
                Size = detail._group and UDim2.new(1, -22, 1, 0) or UDim2.new(0.4, -11, 1, 0),
                Font = detail._group and SEMIBOLD_FONT or DEFAULT_FONT,
                Text = detail._group
                    and string.upper(tostring(detail.Label or detail.Title or "Details"))
                    or tostring(detail.Label or detail.Title or "Detail"),
                TextSize = detail._group and 10 or 12,
                TextTruncate = Enum.TextTruncate.AtEnd,
                TextXAlignment = Enum.TextXAlignment.Left,
                ZIndex = 454,
                Parent = row,
            })
            self:_paint(detailLabel, "TextColor3", detail._group and "Accent" or "Muted")

            local detailValue = create("TextLabel", {
                BackgroundTransparency = 1,
                Position = UDim2.new(0.4, 4, 0, 0),
                Size = UDim2.new(0.6, -15, 1, 0),
                Font = SEMIBOLD_FONT,
                Text = detail._group and "" or tostring(detail.Value or "Unknown"),
                TextSize = 12,
                TextTruncate = Enum.TextTruncate.AtEnd,
                TextXAlignment = Enum.TextXAlignment.Right,
                Visible = not detail._group,
                ZIndex = 454,
                Parent = row,
            })
            if typeof(detail.Color) == "Color3" then
                detailValue.TextColor3 = detail.Color
            else
                self:_paint(detailValue, "TextColor3", self.Theme[detail.Color or "Text"] and (detail.Color or "Text") or "Text")
            end
            if not detail._group and #tostring(detail.Value or "") > 24 then
                self:_attachTooltip(detailValue, tostring(detail.Value))
            end

            if index < #detailList then
                local separator = create("Frame", {
                    Position = UDim2.new(0, 10, 1, -1),
                    Size = UDim2.new(1, -20, 0, 1),
                    BackgroundTransparency = 0.62,
                    BorderSizePixel = 0,
                    ZIndex = 454,
                    Parent = row,
                })
                self:_paint(separator, "BackgroundColor3", "Border")
            end
        end
        return detailsHolder
    end

    if hasDetails then
        if hasTabs then
            for index, tabData in ipairs(dialogTabs) do
                detailFrames[index] = createDetailsPage(tabData.Details, index)
            end
        else
            detailFrames[1] = createDetailsPage(details, 1)
        end
    end

    function handle:SelectTab(tab, silent)
        if not hasTabs then
            return self
        end
        local selectedIndex = tonumber(tab)
        if not selectedIndex then
            for index, tabData in ipairs(dialogTabs) do
                if string.lower(tabData.Title) == string.lower(tostring(tab)) then
                    selectedIndex = index
                    break
                end
            end
        end
        selectedIndex = math.clamp(math.floor(selectedIndex or 1), 1, #dialogTabs)
        self.SelectedTab = selectedIndex
        self.SelectedTabTitle = dialogTabs[selectedIndex].Title
        bodyScroll.CanvasPosition = Vector2.zero
        for index, tabData in ipairs(dialogTabs) do
            local selected = index == selectedIndex
            local detailsFrame = detailFrames[index]
            if detailsFrame then
                detailsFrame.Visible = selected
            end
            local tabObjects = dialogTabButtons[index]
            if tabObjects then
                tween(tabObjects.Button, {
                    BackgroundColor3 = self.Window.Theme[selected and "AccentDark" or "Control"],
                    BackgroundTransparency = selected and 0.12 or 0.45,
                }, TWEEN_FAST)
                tween(tabObjects.Icon, {
                    ImageColor3 = self.Window.Theme[selected and "Accent" or "Muted"],
                }, TWEEN_FAST)
                tween(tabObjects.Label, {
                    TextColor3 = self.Window.Theme[selected and "Text" or "Muted"],
                }, TWEEN_FAST)
            end
        end
        if not silent and type(options.OnTabChanged) == "function" then
            task.spawn(options.OnTabChanged, self.SelectedTabTitle, selectedIndex, dialogTabs[selectedIndex])
        end
        return self
    end

    handle.Window = self
    for index, tabObjects in ipairs(dialogTabButtons) do
        self:_connect(tabObjects.Button.Activated, function()
            handle:SelectTab(index)
        end)
    end
    handle:SelectTab(options.SelectedTab or 1)
    self:_onTheme(function()
        if overlay.Parent and hasTabs then
            handle:SelectTab(handle.SelectedTab or 1, true)
        end
    end)

    if hasInputs then
        local inputHolder = create("Frame", {
            Name = "Inputs",
            Position = UDim2.fromOffset(0, inputTop - bodyTop),
            Size = UDim2.new(1, -4, 0, inputHeight),
            BackgroundTransparency = 1,
            ZIndex = 452,
            Parent = bodyScroll,
        })

        for index, inputOptions in ipairs(inputs) do
            local inputName = tostring(inputOptions.Name or inputOptions.Key or ("Input" .. index))
            local inputBack = create("Frame", {
                Name = inputName,
                Position = UDim2.fromOffset(0, (index - 1) * (inputRowHeight + inputGap)),
                Size = UDim2.new(1, 0, 0, inputRowHeight),
                BorderSizePixel = 0,
                ZIndex = 453,
                Parent = inputHolder,
            })
            addCorner(inputBack, 10)
            local inputStroke = addStroke(inputBack, self.Theme.Border, 0.28, 1)
            self:_paint(inputBack, "BackgroundColor3", "Control")
            self:_paint(inputStroke, "Color", "Border")

            local secure = inputOptions.Secure == true
            local revealed = false
            local textBox = create("TextBox", {
                Name = "Input",
                BackgroundTransparency = 1,
                Position = UDim2.fromOffset(12, 0),
                Size = UDim2.new(1, secure and -48 or -24, 1, 0),
                ClearTextOnFocus = false,
                Font = DEFAULT_FONT,
                PlaceholderText = inputOptions.Placeholder or inputOptions.Title or inputName,
                Text = tostring(inputOptions.Default or ""),
                TextSize = 12,
                TextTruncate = Enum.TextTruncate.AtEnd,
                TextXAlignment = Enum.TextXAlignment.Left,
                ZIndex = 454,
                Parent = inputBack,
            })
            self:_paint(textBox, "TextColor3", "Text")
            self:_paint(textBox, "PlaceholderColor3", "Muted")

            local mask = create("TextLabel", {
                Name = "Mask",
                Active = false,
                BackgroundTransparency = 1,
                Position = textBox.Position,
                Size = textBox.Size,
                Font = DEFAULT_FONT,
                Text = "",
                TextSize = 12,
                TextTruncate = Enum.TextTruncate.AtEnd,
                TextXAlignment = Enum.TextXAlignment.Left,
                ZIndex = 455,
                Parent = inputBack,
            })
            self:_paint(mask, "TextColor3", "Text")

            local function refreshInput()
                handle.Values[inputName] = textBox.Text
                local hidden = secure and not revealed and textBox.Text ~= ""
                textBox.TextTransparency = hidden and 1 or 0
                mask.Text = hidden and string.rep("*", #textBox.Text) or ""
            end

            if secure then
                local revealButton = create("ImageButton", {
                    Name = "Reveal",
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, -9, 0.5, 0),
                    Size = UDim2.fromOffset(21, 21),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AutoButtonColor = false,
                    ImageTransparency = 1,
                    ZIndex = 456,
                    Parent = inputBack,
                })
                addCorner(revealButton, 7)
                local revealIcon = self:_makeIcon(revealButton, "eye", 13, "Muted")
                revealIcon.AnchorPoint = Vector2.new(0.5, 0.5)
                revealIcon.Position = UDim2.fromScale(0.5, 0.5)
                revealIcon.ZIndex = 457
                self:_connect(revealButton.Activated, function()
                    revealed = not revealed
                    refreshInput()
                    tween(revealIcon, {
                        ImageColor3 = self.Theme[revealed and "Accent" or "Muted"],
                    }, TWEEN_FAST)
                end)
            end

            self:_connect(textBox.Focused, function()
                tween(inputStroke, { Color = self.Theme.Accent, Transparency = 0 }, TWEEN_FAST)
                tween(inputBack, { BackgroundColor3 = self.Theme.ControlHover }, TWEEN_FAST)
            end)
            self:_connect(textBox.FocusLost, function()
                tween(inputStroke, { Color = self.Theme.Border, Transparency = 0.28 }, TWEEN_FAST)
                tween(inputBack, { BackgroundColor3 = self.Theme.Control }, TWEEN_FAST)
            end)
            self:_connect(textBox:GetPropertyChangedSignal("Text"), refreshInput)
            handle.Inputs[inputName] = textBox
            refreshInput()
        end
    end

    local statusLabel = create("TextLabel", {
        Name = "DialogStatus",
        Visible = false,
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(18, dialogHeight - 80),
        Size = UDim2.new(1, -36, 0, 18),
        Font = DEFAULT_FONT,
        Text = "",
        TextSize = 11,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 453,
        Parent = card,
    })
    self:_paint(statusLabel, "TextColor3", "Muted")
    handle.StatusLabel = statusLabel
    handle.Buttons = {}

    local buttonHolder = create("Frame", {
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.new(0, 18, 1, -18),
        Size = UDim2.new(1, -36, 0, 36),
        BackgroundTransparency = 1,
        ZIndex = 452,
        Parent = card,
    })
    create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        Padding = UDim.new(0, 9),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = buttonHolder,
    })

    local cardScale
    local dialogWindow = self
    local closed = false
    function handle:GetValue(name)
        local input = self.Inputs[name]
        return input and input.Text or self.Values[name]
    end
    function handle:GetValues()
        local values = {}
        for name, input in pairs(self.Inputs) do
            values[name] = input.Text
        end
        return values
    end
    function handle:SetStatus(message, kind)
        message = trim(message or "")
        statusLabel.Text = message
        statusLabel.Visible = message ~= ""
        local colorKey = kind == "Error" and "Danger"
            or kind == "Success" and "Success"
            or kind == "Warning" and "Warning"
            or "Muted"
        statusLabel.TextColor3 = dialogWindow.Theme[colorKey]
        return self
    end
    function handle:SetBusy(busy, message)
        busy = busy == true
        for _, button in ipairs(self.Buttons) do
            button.Active = not busy
            button.AutoButtonColor = false
            button.TextTransparency = busy and 0.35 or 0
        end
        if message ~= nil then
            self:SetStatus(message, "Info")
        end
        return self
    end
    function handle:Close()
        if closed then
            return
        end
        closed = true
        if dialogWindow._closeDialog == handle then
            dialogWindow._closeDialog = nil
        end
        tween(overlay, { BackgroundTransparency = 1 }, TWEEN_CLOSE)
        local animation = tween(card, { GroupTransparency = 1 }, TWEEN_CLOSE)
        tween(cardScale, { Scale = fitScale * 0.97 }, TWEEN_CLOSE)
        if animation then
            animation.Completed:Once(function()
                if overlay.Parent then
                    overlay:Destroy()
                end
            end)
        else
            overlay:Destroy()
        end
    end


    self:_connect(closeButton.MouseEnter, function()
        tween(closeButton, { BackgroundTransparency = 0.08, BackgroundColor3 = self.Theme.ControlHover }, TWEEN_FAST)
        tween(closeImage, { ImageColor3 = self.Theme.Danger }, TWEEN_FAST)
    end)
    self:_connect(closeButton.MouseLeave, function()
        tween(closeButton, { BackgroundTransparency = 1 }, TWEEN_FAST)
        tween(closeImage, { ImageColor3 = self.Theme.Muted }, TWEEN_FAST)
    end)
    self:_connect(closeButton.Activated, function()
        handle:Close()
    end)

    local buttonGap = 9
    local requestedButtonWidth = 0
    for _, buttonOptions in ipairs(buttons) do
        requestedButtonWidth = requestedButtonWidth + (tonumber(buttonOptions.Width) or 108)
    end
    local availableButtonWidth = dialogWidth - 36 - math.max(#buttons - 1, 0) * buttonGap
    local buttonWidthScale = math.min(1, availableButtonWidth / math.max(requestedButtonWidth, 1))

    for index, buttonOptions in ipairs(buttons) do
        local isPrimary = buttonOptions.Primary == true or index == #buttons
        local buttonWidth = math.max(48, math.floor((tonumber(buttonOptions.Width) or 108) * buttonWidthScale))
        local button = create("TextButton", {
            Name = buttonOptions.Title or "Button",
            Size = UDim2.fromOffset(buttonWidth, 36),
            BorderSizePixel = 0,
            AutoButtonColor = false,
            Font = SEMIBOLD_FONT,
            Text = buttonOptions.Title or "Button",
            TextSize = 12,
            LayoutOrder = index,
            ZIndex = 453,
            Parent = buttonHolder,
        })
        table.insert(handle.Buttons, button)
        addCorner(button, 11)
        self:_paint(button, "BackgroundColor3", isPrimary and "Accent" or "Control")
        self:_paint(button, "TextColor3", isPrimary and "AccentText" or "Text")
        local buttonScale = create("UIScale", {
            Scale = 1,
            Parent = button,
        })
        self:_connect(button.MouseEnter, function()
            local hoverColor = isPrimary
                and mix(self.Theme.Accent, self.Theme.Text, 0.12)
                or self.Theme.ControlHover
            tween(button, { BackgroundColor3 = hoverColor })
            tween(buttonScale, { Scale = 1.03 }, TWEEN_FAST)
        end)
        self:_connect(button.MouseLeave, function()
            tween(button, {
                BackgroundColor3 = self.Theme[isPrimary and "Accent" or "Control"],
            })
            tween(buttonScale, { Scale = 1 }, TWEEN_FAST)
        end)
        self:_connect(button.Activated, function()
            if buttonOptions.Close ~= false then
                handle:Close()
            end
            safeCallback(buttonOptions.Callback, handle)
        end)
    end

    if options.CloseOnBackdrop == true then
        self:_connect(overlay.Activated, function()
            handle:Close()
        end)
    end

    cardScale = create("UIScale", {
        Scale = fitScale * 0.94,
        Parent = card,
    })
    tween(overlay, { BackgroundTransparency = 0.42 }, TWEEN_NORMAL)
    tween(card, { GroupTransparency = 0 }, TWEEN_NORMAL)
    tween(cardScale, { Scale = fitScale }, TWEEN_POP)
    return handle
end

function Window:Watermark(options)
    options = type(options) == "table" and options or { Text = tostring(options or self.Title) }
    local frame = create("Frame", {
        Name = "Watermark",
        Position = options.Position or UDim2.fromOffset(16, 16),
        Size = UDim2.fromOffset(options.Width or 176, 34),
        BorderSizePixel = 0,
        ZIndex = 250,
        Parent = self.ScreenGui,
    })
    addCorner(frame, 10)
    local frameStroke = addStroke(frame, self.Theme.Border, 0.18, 1)
    self:_paint(frame, "BackgroundColor3", "Topbar")
    self:_paint(frameStroke, "Color", "Border")

    local icon = self:_makeIcon(frame, options.Icon or "diamond", 15, "Accent")
    icon.AnchorPoint = Vector2.new(0, 0.5)
    icon.Position = UDim2.new(0, 10, 0.5, 0)
    icon.ZIndex = 251

    local label = create("TextLabel", {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(34, 0),
        Size = UDim2.new(1, -43, 1, 0),
        Font = SEMIBOLD_FONT,
        Text = options.Text or self.Title,
            TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        ZIndex = 251,
        Parent = frame,
    })
    self:_paint(label, "TextColor3", "Text")

    local dragging = false
    local dragStart
    local startPosition
    self:_connect(frame.InputBegan, function(input)
        local inputType = input.UserInputType
        if inputType == Enum.UserInputType.MouseButton1 or inputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPosition = frame.Position
        end
    end)
    self:_connect(UserInputService.InputChanged, function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch)
        then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPosition.X.Scale,
                startPosition.X.Offset + delta.X,
                startPosition.Y.Scale,
                startPosition.Y.Offset + delta.Y
            )
        end
    end)
    self:_connect(UserInputService.InputEnded, function(input)
        local inputType = input.UserInputType
        if inputType == Enum.UserInputType.MouseButton1 or inputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    local handle = { Instance = frame }
    function handle:SetText(value)
        label.Text = tostring(value)
        return self
    end
    function handle:SetVisible(visible)
        frame.Visible = visible == true
        return self
    end
    function handle:Destroy()
        frame:Destroy()
    end
    return handle
end

local function serializeValue(value)
    local valueType = typeof(value)
    if valueType == "Color3" then
        return { __type = "Color3", value = colorToHex(value) }
    elseif valueType == "EnumItem" then
        return { __type = "KeyCode", value = value.Name }
    elseif valueType == "table" then
        local result = {}
        for key, child in pairs(value) do
            result[key] = serializeValue(child)
        end
        return result
    elseif valueType == "boolean" or valueType == "number" or valueType == "string" then
        return value
    end
    return nil
end

local function deserializeValue(value)
    if type(value) ~= "table" then
        return value
    end
    if value.__type == "Color3" then
        return hexToColor(value.value)
    elseif value.__type == "KeyCode" then
        return Enum.KeyCode[value.value] or Enum.KeyCode.Unknown
    end

    local result = {}
    for key, child in pairs(value) do
        result[key] = deserializeValue(child)
    end
    return result
end

function Window:GetConfigPath()
    return configPath()
end

function Window:_queueConfigSave()
    if not self._autoSave or self._loadingConfig or self._destroyed or not canUseConfigStorage() then
        return
    end

    self._saveToken = (self._saveToken or 0) + 1
    local token = self._saveToken
    task.delay(0.45, function()
        if token == self._saveToken and not self._destroyed and not self._loadingConfig then
            self:SaveConfig()
        end
    end)
end

function Window:SaveConfig()
    if type(writefile) ~= "function" or type(makefolder) ~= "function" then
        return false, "File config storage is unavailable"
    end

    local path = self:GetConfigPath()
    pcall(makefolder, "Mytrah")
    pcall(makefolder, "Mytrah/Configs")
    pcall(makefolder, path:match("^(.*)/[^/]+$") or "Mytrah/Configs")

    local payload
    local encoded, encodeError = pcall(function()
        payload = self:ExportConfig()
    end)
    if not encoded then
        return false, encodeError
    end

    local written, writeError = pcall(writefile, path, payload)
    if not written then
        return false, writeError
    end
    return true, path
end

function Window:LoadConfig(options)
    options = options or {}
    if type(readfile) ~= "function" then
        return false, "File config storage is unavailable"
    end

    local path = self:GetConfigPath()
    local loaded, payload = pcall(readfile, path)
    if not loaded or type(payload) ~= "string" then
        return false, payload or "No saved config"
    end

    local decoded, data = pcall(function()
        return HttpService:JSONDecode(payload)
    end)
    if not decoded or type(data) ~= "table" then
        return false, data or "Invalid saved config"
    end

    self._loadingConfig = true
    if data.theme then
        pcall(function()
            self:SetTheme(data.theme)
        end)
    end
    if data.font then
        pcall(function()
            self:SetFont(data.font)
        end)
    end

    local pending = {}
    local savedValues = type(data.values) == "table" and data.values or {}
    for flag, value in pairs(savedValues) do
        local option = self.Options[flag]
        if option and type(option.SetValue) == "function" then
            table.insert(pending, {
                Flag = flag,
                Option = option,
                Value = deserializeValue(value),
            })
        end
    end
    table.sort(pending, function(left, right)
        return tostring(left.Flag) < tostring(right.Flag)
    end)

    local animated = options.Animated ~= false
    local stepDelay = animated and 0.045 or 0
    local silent = options.Silent == true
    local notify = options.Notify ~= false
    if #pending == 0 then
        self._loadingConfig = false
        if notify then
            self:Notify({
                Title = "Settings restored",
                Content = "Your saved settings are ready.",
                Type = "Info",
                Duration = 3,
            })
        end
        return true, path
    end

    for index, entry in ipairs(pending) do
        task.delay((index - 1) * stepDelay, function()
            if self._destroyed then
                return
            end
            pcall(function()
                entry.Option:SetValue(entry.Value, silent)
            end)
            if index == #pending then
                self._loadingConfig = false
                if notify then
                    self:Notify({
                        Title = "Settings restored",
                        Content = "Your saved settings are ready.",
                        Type = "Info",
                        Duration = 3,
                    })
                end
            end
        end)
    end
    return true, path
end

function Window:ClearConfig()
    if type(delfile) ~= "function" then
        return false, "File config storage is unavailable"
    end
    local removed, removeError = pcall(delfile, self:GetConfigPath())
    if not removed then
        return false, removeError
    end
    return true
end

function Window:ExportConfig()
    local values = {}
    for flag, option in pairs(self.Options) do
        values[flag] = serializeValue(option:GetValue())
    end
    return HttpService:JSONEncode({
        version = Mytrah.Version,
        theme = self.ThemeName,
        font = self.FontName,
        values = values,
    })
end

function Window:ImportConfig(payload, silent)
    local data = type(payload) == "string" and HttpService:JSONDecode(payload) or payload
    assert(type(data) == "table", "Config must be a JSON string or table")

    if data.theme then
        pcall(function()
            self:SetTheme(data.theme)
        end)
    end
    if data.font then
        pcall(function()
            self:SetFont(data.font)
        end)
    end

    for flag, value in pairs(data.values or data) do
        local option = self.Options[flag]
        if option and type(option.SetValue) == "function" then
            option:SetValue(deserializeValue(value), silent == true)
        end
    end
    return self
end

function Window:GetOption(flag)
    return self.Options[flag]
end

function Mytrah:SetTheme(theme)
    if self._activeWindow then
        self._activeWindow:SetTheme(theme)
    end
    return self
end

function Mytrah:SetFont(font)
    if self._activeWindow then
        self._activeWindow:SetFont(font)
    end
    return self
end

function Mytrah:SaveConfig()
    if self._activeWindow then
        return self._activeWindow:SaveConfig()
    end
    return false, "No active Mytrah window"
end

function Mytrah:LoadConfig(options)
    if self._activeWindow then
        return self._activeWindow:LoadConfig(options)
    end
    return false, "No active Mytrah window"
end

function Mytrah:Unload()
    if self._activeWindow then
        self._activeWindow:Destroy()
    end
end

return Mytrah
