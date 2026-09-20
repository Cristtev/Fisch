-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()
local scriptActive = true
local playerGui = player:WaitForChild("PlayerGui")
local DecalId = "rbxassetid://127146640160948"

if playerGui:FindFirstChild("FischMovementGUI") then playerGui.FischMovementGUI:Destroy() end
if playerGui:FindFirstChild("FischIntroGUI") then playerGui.FischIntroGUI:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FischMovementGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = playerGui


-- 1. FUTURISTIC AQUATIC INTRO LOADING SCREEN

local IntroGui = Instance.new("ScreenGui")
IntroGui.Name = "FischIntroGUI"
IntroGui.ResetOnSpawn = false
IntroGui.Parent = playerGui

local IntroFrame = Instance.new("Frame")
IntroFrame.Size = UDim2.new(0, 400, 0, 290)
IntroFrame.Position = UDim2.new(0.5, -200, 0.5, -145)
IntroFrame.BackgroundColor3 = Color3.fromRGB(2, 8, 18)
IntroFrame.BorderSizePixel = 0
IntroFrame.Parent = IntroGui

local IntroCorner = Instance.new("UICorner")
IntroCorner.CornerRadius = UDim.new(0, 16)
IntroCorner.Parent = IntroFrame

local IntroStroke = Instance.new("UIStroke")
IntroStroke.Color = Color3.fromRGB(0, 240, 255)
IntroStroke.Transparency = 0.2
IntroStroke.Thickness = 2
IntroStroke.Parent = IntroFrame

local LogoContainer = Instance.new("Frame")
LogoContainer.Size = UDim2.new(0, 80, 0, 80)
LogoContainer.Position = UDim2.new(0.5, -40, 0, 25)
LogoContainer.BackgroundColor3 = Color3.fromRGB(4, 16, 32)
LogoContainer.BorderSizePixel = 0
LogoContainer.Parent = IntroFrame

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0, 16)
LogoCorner.Parent = LogoContainer

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Color = Color3.fromRGB(0, 255, 200)
LogoStroke.Thickness = 1.5
LogoStroke.Parent = LogoContainer

local IntroImageHolder = Instance.new("Frame")
IntroImageHolder.Name = "IntroImageHolder"
IntroImageHolder.Size = UDim2.new(0, 80, 0, 80)
IntroImageHolder.Position = UDim2.new(0.5, -40, 0, 25)
IntroImageHolder.BackgroundTransparency = 1
IntroImageHolder.BorderSizePixel = 0
IntroImageHolder.Parent = IntroFrame

local IntroImage = Instance.new("ImageLabel")
IntroImage.Name = "IntroImage"
IntroImage.Parent = IntroImageHolder
IntroImage.BackgroundTransparency = 1
IntroImage.AnchorPoint = Vector2.new(0.5, 0.5)
IntroImage.Position = UDim2.new(0.5, 0, 0.5, 0)
IntroImage.Size = UDim2.new(0, 68, 0, 68)
IntroImage.Image = DecalId
IntroImage.ZIndex = 103

local IntroTitle = Instance.new("TextLabel")
IntroTitle.Size = UDim2.new(1, 0, 0, 30)
IntroTitle.Position = UDim2.new(0, 0, 0, 120)
IntroTitle.BackgroundTransparency = 1
IntroTitle.Font = Enum.Font.GothamBold
IntroTitle.Text = "RUISHI HUB"
IntroTitle.TextColor3 = Color3.fromRGB(0, 240, 255)
IntroTitle.TextSize = 16
IntroTitle.Parent = IntroFrame

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(1, 0, 0, 20)
StatusText.Position = UDim2.new(0, 0, 0, 155)
StatusText.BackgroundTransparency = 1
StatusText.Font = Enum.Font.GothamMedium
StatusText.Text = "Synchronizing 75 Ocean Waypoints..."
StatusText.TextColor3 = Color3.fromRGB(120, 200, 220)
StatusText.TextSize = 12
StatusText.Parent = IntroFrame

local BarBg = Instance.new("Frame")
BarBg.Size = UDim2.new(0, 330, 0, 6)
BarBg.Position = UDim2.new(0.5, -165, 0, 200)
BarBg.BackgroundColor3 = Color3.fromRGB(8, 22, 40)
BarBg.BorderSizePixel = 0
BarBg.Parent = IntroFrame

local BarBgCorner = Instance.new("UICorner")
BarBgCorner.CornerRadius = UDim.new(1, 0)
BarBgCorner.Parent = BarBg

local BarFill = Instance.new("Frame")
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Color3.fromRGB(0, 255, 220)
BarFill.BorderSizePixel = 0
BarFill.Parent = BarBg

local BarFillCorner = Instance.new("UICorner")
BarFillCorner.CornerRadius = UDim.new(1, 0)
BarFillCorner.Parent = BarFill



-- 2. MAIN HOLOGRAPHIC AQUATIC INTERFACE

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 580, 0, 440)
MainFrame.Position = UDim2.new(0.5, -290, 0.5, -220)
MainFrame.BackgroundColor3 = Color3.fromRGB(2, 6, 14)
MainFrame.BackgroundTransparency = 1
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = false
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0, 230, 255)
MainStroke.Transparency = 1
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

local OceanGradient = Instance.new("UIGradient")
OceanGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(4, 15, 32)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(2, 8, 18)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(1, 4, 10))
})
OceanGradient.Rotation = 45
OceanGradient.Parent = MainFrame

-- Floating Realistic Translucent Bubbles
local BubbleContainer = Instance.new("Folder")
BubbleContainer.Name = "BubbleContainer"
BubbleContainer.Parent = MainFrame

task.spawn(function()
	for i = 1, 15 do
		local bubble = Instance.new("Frame")
		local size = math.random(4, 14)
		bubble.Size = UDim2.new(0, size, 0, size)
		bubble.Position = UDim2.new(math.random(5, 95)/100, 0, 1.1, 0)
		bubble.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		bubble.BackgroundTransparency = 0.7
		bubble.BorderSizePixel = 0
		bubble.Parent = BubbleContainer
		
		local bCorner = Instance.new("UICorner")
		bCorner.CornerRadius = UDim.new(1, 0)
		bCorner.Parent = bubble
		
		local bStroke = Instance.new("UIStroke")
		bStroke.Color = Color3.fromRGB(180, 240, 255)
		bStroke.Transparency = 0.3
		bStroke.Thickness = 1
		bStroke.Parent = bubble
		
		task.spawn(function()
			while scriptActive and MainFrame.Parent do
				local speed = math.random(7, 14)
				local tw = TweenService:Create(bubble, TweenInfo.new(speed, Enum.EasingStyle.Linear), {
					Position = UDim2.new(bubble.Position.X.Scale + math.random(-4, 4)/100, 0, -0.1, 0),
					BackgroundTransparency = 0.95
				})
				tw:Play()
				tw.Completed:Wait()
				bubble.Position = UDim2.new(math.random(5, 95)/100, 0, 1.1, 0)
				bubble.BackgroundTransparency = 0.7
				task.wait(math.random(1, 3))
			end
		end)
	end
end)

-- Header Bar
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundTransparency = 1
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -60, 1, 0)
TitleLabel.Position = UDim2.new(0, 18, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "⚡ Ruishi Hub || Fisch v0.2"
TitleLabel.TextColor3 = Color3.fromRGB(0, 240, 255)
TitleLabel.TextTransparency = 1
TitleLabel.TextSize = 13
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = TopBar
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 45, 85)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -38, 0.5, -12)
CloseButton.Size = UDim2.new(0, 24, 0, 24)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 12

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton


-- Sidebar Navigation Tabs
local Sidebar = Instance.new("ScrollingFrame")
Sidebar.Size = UDim2.new(0, 160, 1, -45)
Sidebar.Position = UDim2.new(0, 0, 0, 45)
Sidebar.BackgroundTransparency = 1
Sidebar.BorderSizePixel = 0
Sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
Sidebar.ScrollBarThickness = 0
Sidebar.Parent = MainFrame

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Padding = UDim.new(0, 8)
SidebarLayout.Parent = Sidebar

local SidebarPadding = Instance.new("UIPadding")
SidebarPadding.PaddingTop = UDim.new(0, 15)
SidebarPadding.Parent = Sidebar

-- Content Scrolling Container Area
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -165, 1, -50)
ContentArea.Position = UDim2.new(0, 165, 0, 48)
ContentArea.BackgroundTransparency = 1
ContentArea.ClipsDescendants = true
ContentArea.Parent = MainFrame

local tabs = {}
local tabNames = {"Player", "Teleports", "Settings"}

for i, name in ipairs(tabNames) do
	local scroll = Instance.new("ScrollingFrame")
	scroll.Name = name .. "Tab"
	scroll.Size = UDim2.new(1, 0, 1, 0)
	scroll.BackgroundTransparency = 1
	scroll.BorderSizePixel = 0
	scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
	scroll.ScrollBarThickness = 3
	scroll.ScrollBarImageColor3 = Color3.fromRGB(0, 220, 255)
	scroll.Visible = (i == 1)
	scroll.ClipsDescendants = true
	scroll.Parent = ContentArea

	local layout = Instance.new("UIListLayout")
	layout.HorizontalAlignment = Enum.HorizontalAlignment.Left
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Padding = UDim.new(0, 14)
	layout.Parent = scroll

	local padding = Instance.new("UIPadding")
	padding.PaddingTop = UDim.new(0, 6)
	padding.PaddingLeft = UDim.new(0, 6)
	padding.Parent = scroll

	tabs[name] = scroll
end

local tabButtons = {}
for i, name in ipairs(tabNames) do
	local tabBtn = Instance.new("TextButton")
	tabBtn.Size = UDim2.new(0, 140, 0, 38)
	tabBtn.BackgroundColor3 = (i == 1) and Color3.fromRGB(0, 220, 255) or Color3.fromRGB(6, 16, 32)
	tabBtn.BackgroundTransparency = 1
	tabBtn.Font = Enum.Font.GothamBold
	tabBtn.Text = name
	tabBtn.TextColor3 = (i == 1) and Color3.fromRGB(2, 6, 14) or Color3.fromRGB(140, 190, 220)
	tabBtn.TextSize = 12
	tabBtn.AutoButtonColor = false
	tabBtn.Parent = Sidebar

	local btnCorner = Instance.new("UICorner")
	btnCorner.CornerRadius = UDim.new(0, 8)
	btnCorner.Parent = tabBtn

	local indicator = Instance.new("Frame")
	indicator.Size = UDim2.new(0, 3, 0, 18)
	indicator.Position = UDim2.new(0, 4, 0.5, -9)
	indicator.BackgroundColor3 = Color3.fromRGB(0, 255, 220)
	indicator.BackgroundTransparency = (i == 1) and 0 or 1
	indicator.BorderSizePixel = 0
	indicator.Parent = tabBtn

	local indCorner = Instance.new("UICorner")
	indCorner.CornerRadius = UDim.new(1, 0)
	indCorner.Parent = indicator

	tabButtons[name] = {Button = tabBtn, Indicator = indicator}

	tabBtn.MouseButton1Click:Connect(function()
		for _, tScroll in pairs(tabs) do tScroll.Visible = false end
		for tName, data in pairs(tabButtons) do
			data.Button.BackgroundColor3 = Color3.fromRGB(6, 16, 32)
			data.Button.TextColor3 = Color3.fromRGB(140, 190, 220)
			data.Indicator.BackgroundTransparency = 1
		end
		tabs[name].Visible = true
		tabBtn.BackgroundColor3 = Color3.fromRGB(0, 220, 255)
		tabBtn.TextColor3 = Color3.fromRGB(2, 6, 14)
		indicator.BackgroundTransparency = 0
	end)
end



-- CLEAN UI COMPONENT BUILDERS (ZERO WHITE BACKGROUNDS)

local function createSlider(parent, name, min, default, max, callback)
	local container = Instance.new("Frame")
	container.Size = UDim2.new(0, 380, 0, 52)
	container.BackgroundColor3 = Color3.fromRGB(5, 15, 30)
	container.BackgroundTransparency = 0.12
	container.BorderSizePixel = 0
	container.Parent = parent

	local containerCorner = Instance.new("UICorner")
	containerCorner.CornerRadius = UDim.new(0, 9)
	containerCorner.Parent = container

	local containerStroke = Instance.new("UIStroke")
	containerStroke.Color = Color3.fromRGB(0, 155, 210)
	containerStroke.Transparency = 0.72
	containerStroke.Thickness = 1
	containerStroke.Parent = container

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, 0, 0, 20)
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.GothamSemibold
	label.Text = name .. " : " .. default
	label.TextColor3 = Color3.fromRGB(210, 235, 255)
	label.TextTransparency = 1
	label.TextSize = 12
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = container

	local sliderBg = Instance.new("Frame")
	sliderBg.Size = UDim2.new(1, 0, 0, 8)
	sliderBg.Position = UDim2.new(0, 0, 0, 28)
	sliderBg.BackgroundColor3 = Color3.fromRGB(6, 16, 32)
	sliderBg.BackgroundTransparency = 1
	sliderBg.BorderSizePixel = 0
	sliderBg.Parent = container

	local bgCorner = Instance.new("UICorner")
	bgCorner.CornerRadius = UDim.new(1, 0)
	bgCorner.Parent = sliderBg

	local sliderFill = Instance.new("Frame")
	sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
	sliderFill.BackgroundColor3 = Color3.fromRGB(0, 220, 255)
	sliderFill.BackgroundTransparency = 1
	sliderFill.BorderSizePixel = 0
	sliderFill.Parent = sliderBg

	local fillCorner = Instance.new("UICorner")
	fillCorner.CornerRadius = UDim.new(1, 0)
	fillCorner.Parent = sliderFill

	local knob = Instance.new("Frame")
	knob.Size = UDim2.new(0, 14, 0, 14)
	knob.AnchorPoint = Vector2.new(0.5, 0.5)
	knob.Position = UDim2.new(1, 0, 0.5, 0)
	knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	knob.BackgroundTransparency = 1
	knob.Parent = sliderFill

	local knobCorner = Instance.new("UICorner")
	knobCorner.CornerRadius = UDim.new(1, 0)
	knobCorner.Parent = knob

	local dragging = false
	sliderBg.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
		end
	end)
	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local pos = UDim2.new(math.clamp((input.Position.X - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1), 0, 1, 0)
			sliderFill.Size = pos
			local val = math.floor(min + (max - min) * pos.X.Scale)
			label.Text = name .. " : " .. val
			callback(val)
		end
	end)
end

local function createToggle(parent, name, callback)
	local container = Instance.new("Frame")
	container.Size = UDim2.new(0, 380, 0, 38)
	container.BackgroundColor3 = Color3.fromRGB(5, 15, 30)
	container.BackgroundTransparency = 0.12
	container.BorderSizePixel = 0
	container.Parent = parent

	local containerCorner = Instance.new("UICorner")
	containerCorner.CornerRadius = UDim.new(0, 9)
	containerCorner.Parent = container

	local containerStroke = Instance.new("UIStroke")
	containerStroke.Color = Color3.fromRGB(0, 155, 210)
	containerStroke.Transparency = 0.72
	containerStroke.Thickness = 1
	containerStroke.Parent = container

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -60, 1, 0)
	label.Position = UDim2.new(0, 4, 0, 0)
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.GothamMedium
	label.Text = name
	label.TextColor3 = Color3.fromRGB(210, 235, 255)
	label.TextTransparency = 1
	label.TextSize = 12
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = container

	local toggleBtn = Instance.new("TextButton")
	toggleBtn.Size = UDim2.new(0, 42, 0, 22)
	toggleBtn.Position = UDim2.new(1, -44, 0.5, -11)
	toggleBtn.BackgroundColor3 = Color3.fromRGB(8, 20, 38)
	toggleBtn.BackgroundTransparency = 1
	toggleBtn.Text = ""
	toggleBtn.AutoButtonColor = false
	toggleBtn.Parent = container

	local btnCorner = Instance.new("UICorner")
	btnCorner.CornerRadius = UDim.new(1, 0)
	btnCorner.Parent = toggleBtn

	local circle = Instance.new("Frame")
	circle.Size = UDim2.new(0, 16, 0, 16)
	circle.Position = UDim2.new(0, 3, 0.5, -8)
	circle.BackgroundColor3 = Color3.fromRGB(150, 180, 200)
	circle.BackgroundTransparency = 1
	circle.BorderSizePixel = 0
	circle.Parent = toggleBtn

	local circleCorner = Instance.new("UICorner")
	circleCorner.CornerRadius = UDim.new(1, 0)
	circleCorner.Parent = circle

	local toggled = false
	local function updateVisual(state)
		toggled = state
		if toggled then
			circle:TweenPosition(UDim2.new(1, -19, 0.5, -8), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15, true)
			toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 220, 255)
			circle.BackgroundColor3 = Color3.fromRGB(2, 6, 14)
		else
			circle:TweenPosition(UDim2.new(0, 3, 0.5, -8), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15, true)
			toggleBtn.BackgroundColor3 = Color3.fromRGB(8, 20, 38)
			circle.BackgroundColor3 = Color3.fromRGB(150, 180, 200)
		end
		callback(toggled)
	end

	toggleBtn.MouseButton1Click:Connect(function() updateVisual(not toggled) end)
	return { Set = updateVisual, Get = function() return toggled end }
end

local function createButton(parent, name, callback)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0, 380, 0, 38)
	btn.BackgroundColor3 = Color3.fromRGB(6, 22, 42)
	btn.BackgroundTransparency = 0.08
	btn.Font = Enum.Font.GothamSemibold
	btn.Text = name
	btn.TextColor3 = Color3.fromRGB(0, 240, 255)
	btn.TextTransparency = 1
	btn.TextSize = 12
	btn.AutoButtonColor = false
	btn.Parent = parent

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = btn

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(0, 200, 255)
	stroke.Transparency = 0.4
	stroke.Thickness = 1
	stroke.Parent = btn

	btn.MouseButton1Click:Connect(callback)
	return btn
end



-- PLAYER TAB MODULES

local playerTab = tabs["Player"]
local currentSpeed = 16
local currentJump = 50
local flySpeed = 50
local flyEnabled = false
local noclipEnabled = false
local walkWaterEnabled = false
local infJumpEnabled = false
local ctrlTpEnabled = false

createSlider(playerTab, "Speed", 0, 16, 500, function(v) currentSpeed = v end)
createSlider(playerTab, "Jump", 0, 50, 500, function(v) currentJump = v end)
createSlider(playerTab, "Fly Speed", 0, 50, 150, function(v) flySpeed = v end)

createToggle(playerTab, "Fly", function(state) flyEnabled = state end)
createToggle(playerTab, "No-clip", function(state) noclipEnabled = state end)
createToggle(playerTab, "Walk Water (Solid Ocean Engine)", function(state) walkWaterEnabled = state end)
createToggle(playerTab, "Inf Jump", function(state) infJumpEnabled = state end)
createToggle(playerTab, "Left Ctrl + Left Click Teleport", function(state) ctrlTpEnabled = state end)
createToggle(playerTab, "Player ESP", function(state) _G.PlayerEspEnabled = state end)



-- TELEPORT TAB (FIXED CONTAINERS & 75 EXACT FISCH LOCATIONS)

local tpTab = tabs["Teleports"]
local selectedTargetPlayer = nil
local selectedIslandCF = nil

local tpStatus = Instance.new("TextLabel")
tpStatus.Size = UDim2.new(0, 380, 0, 24)
tpStatus.BackgroundTransparency = 1
tpStatus.Font = Enum.Font.GothamMedium
tpStatus.Text = "Teleport console ready"
tpStatus.TextColor3 = Color3.fromRGB(120, 200, 220)
tpStatus.TextSize = 11
tpStatus.TextXAlignment = Enum.TextXAlignment.Left
tpStatus.Parent = tpTab

local function setTeleportStatus(message, isError)
	tpStatus.Text = message
	tpStatus.TextColor3 = isError and Color3.fromRGB(255, 125, 145) or Color3.fromRGB(120, 230, 220)
end

-- 1. Player Teleport Row (Dedicated Island Style Container, Zero Overlap)
local playerTpRow = Instance.new("Frame")
playerTpRow.Size = UDim2.new(0, 380, 0, 42)
playerTpRow.BackgroundTransparency = 1
playerTpRow.ZIndex = 10
playerTpRow.Parent = tpTab

local dropdownBtn = Instance.new("TextBox")
dropdownBtn.Size = UDim2.new(0, 230, 1, 0)
dropdownBtn.BackgroundColor3 = Color3.fromRGB(6, 16, 32)
dropdownBtn.BackgroundTransparency = 1
dropdownBtn.ZIndex = 11
dropdownBtn.Font = Enum.Font.GothamMedium
dropdownBtn.Text = ""
dropdownBtn.PlaceholderText = "Search player..."
dropdownBtn.ClearTextOnFocus = false
dropdownBtn.TextColor3 = Color3.fromRGB(210, 235, 255)
dropdownBtn.TextTransparency = 1
dropdownBtn.TextSize = 11
dropdownBtn.AutoButtonColor = false
dropdownBtn.Parent = playerTpRow

local dropCorner = Instance.new("UICorner")
dropCorner.CornerRadius = UDim.new(0, 8)
dropCorner.Parent = dropdownBtn

local dropStroke = Instance.new("UIStroke")
dropStroke.Color = Color3.fromRGB(0, 200, 255)
dropStroke.Transparency = 0.5
dropStroke.Thickness = 1
dropStroke.Parent = dropdownBtn

local tpPlayerBtn = Instance.new("TextButton")
tpPlayerBtn.Size = UDim2.new(0, 104, 1, 0)
tpPlayerBtn.Position = UDim2.new(0, 240, 0, 0)
tpPlayerBtn.BackgroundColor3 = Color3.fromRGB(0, 220, 255)
tpPlayerBtn.BackgroundTransparency = 1
tpPlayerBtn.ZIndex = 11
tpPlayerBtn.Font = Enum.Font.GothamBold
tpPlayerBtn.Text = "TP Player"
tpPlayerBtn.TextColor3 = Color3.fromRGB(2, 6, 14)
tpPlayerBtn.TextTransparency = 1
tpPlayerBtn.TextSize = 12
tpPlayerBtn.AutoButtonColor = false
tpPlayerBtn.Parent = playerTpRow

local refreshPlayersBtn = Instance.new("TextButton")
refreshPlayersBtn.Size = UDim2.new(0, 28, 1, 0)
refreshPlayersBtn.Position = UDim2.new(0, 352, 0, 0)
refreshPlayersBtn.BackgroundColor3 = Color3.fromRGB(10, 38, 58)
refreshPlayersBtn.BackgroundTransparency = 1
refreshPlayersBtn.Font = Enum.Font.GothamBold
refreshPlayersBtn.Text = "Refresh"
refreshPlayersBtn.TextColor3 = Color3.fromRGB(0, 240, 255)
refreshPlayersBtn.TextTransparency = 1
refreshPlayersBtn.TextSize = 9
refreshPlayersBtn.AutoButtonColor = false
refreshPlayersBtn.Parent = playerTpRow

local refreshCorner = Instance.new("UICorner")
refreshCorner.CornerRadius = UDim.new(0, 8)
refreshCorner.Parent = refreshPlayersBtn

local tpPlayerCorner = Instance.new("UICorner")
tpPlayerCorner.CornerRadius = UDim.new(0, 8)
tpPlayerCorner.Parent = tpPlayerBtn

local playerListHolder = Instance.new("ScrollingFrame")
playerListHolder.Size = UDim2.new(0, 230, 0, 0)
playerListHolder.Position = UDim2.new(0, 0, 1, 4)
playerListHolder.BackgroundColor3 = Color3.fromRGB(3, 10, 22)
playerListHolder.BackgroundTransparency = 1
playerListHolder.BorderSizePixel = 0
playerListHolder.Visible = false
playerListHolder.ZIndex = 50
playerListHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
playerListHolder.Parent = playerTpRow

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent = playerListHolder

local function updatePlayerList()
	for _, child in ipairs(playerListHolder:GetChildren()) do
		if child:IsA("TextButton") then child:Destroy() end
	end
	local count = 0
	for _, p in ipairs(Players:GetPlayers()) do
		local query = string.lower(dropdownBtn.Text)
		local matchesName = string.find(string.lower(p.Name), query, 1, true)
		local matchesDisplayName = string.find(string.lower(p.DisplayName), query, 1, true)
		if p ~= player and (query == "" or matchesName or matchesDisplayName) then
			count = count + 1
			local pBtn = Instance.new("TextButton")
			pBtn.Size = UDim2.new(1, 0, 0, 28)
			pBtn.BackgroundColor3 = Color3.fromRGB(6, 16, 32)
			pBtn.BackgroundTransparency = 1
			pBtn.ZIndex = 51
			pBtn.Font = Enum.Font.Gotham
			pBtn.Text = p.DisplayName .. "  (" .. p.Name .. ")"
			pBtn.TextColor3 = Color3.fromRGB(0, 240, 255)
			pBtn.TextSize = 11
			pBtn.Parent = playerListHolder
			
			pBtn.MouseButton1Click:Connect(function()
				selectedTargetPlayer = p
				dropdownBtn.Text = ""
				dropdownBtn.PlaceholderText = "Target: " .. p.Name
				TweenService:Create(playerListHolder, TweenInfo.new(0.2), {Size = UDim2.new(0, 230, 0, 0)}):Play()
				task.wait(0.2)
				playerListHolder.Visible = false
			end)
		end
	end
	playerListHolder.CanvasSize = UDim2.new(0, 0, 0, count * 28)
	if selectedTargetPlayer and not selectedTargetPlayer.Parent then
		selectedTargetPlayer = nil
		dropdownBtn.Text = ""
	end
	setTeleportStatus(count > 0 and (count .. " player(s) available") or "No other players in this server", count == 0)
end



refreshPlayersBtn.MouseButton1Click:Connect(updatePlayerList)

local function resizePlayerResults()
	local resultCount = 0
	for _, child in ipairs(playerListHolder:GetChildren()) do
		if child:IsA("TextButton") then resultCount = resultCount + 1 end
	end
	playerListHolder.Size = UDim2.new(0, 230, 0, math.min(130, math.max(28, resultCount * 28)))
end

dropdownBtn:GetPropertyChangedSignal("Text"):Connect(function()
	updatePlayerList()
	if dropdownBtn:IsFocused() then
		playerListHolder.Visible = true
		resizePlayerResults()
	end
end)

dropdownBtn.Focused:Connect(function()
	updatePlayerList()
	playerListHolder.Visible = true
	resizePlayerResults()
end)

dropdownBtn.FocusLost:Connect(function()
	task.delay(0.15, function()
		if not dropdownBtn:IsFocused() then
			TweenService:Create(playerListHolder, TweenInfo.new(0.2), {Size = UDim2.new(0, 230, 0, 0)}):Play()
			task.wait(0.2)
			playerListHolder.Visible = false
		end
	end)
end)

Players.PlayerAdded:Connect(function()
	if playerListHolder.Visible then updatePlayerList() end
end)

Players.PlayerRemoving:Connect(function(leavingPlayer)
	if leavingPlayer == selectedTargetPlayer then
		selectedTargetPlayer = nil
		dropdownBtn.Text = ""
		dropdownBtn.PlaceholderText = "Search player..."
		setTeleportStatus("Selected player left the server", true)
	end
	if playerListHolder.Visible then updatePlayerList() end
end)

-- Fixed working direct player teleport logic
tpPlayerBtn.MouseButton1Click:Connect(function()
	if not selectedTargetPlayer or not selectedTargetPlayer.Parent then
		setTeleportStatus("Select a valid player first", true)
		return
	end

	local myCharacter = player.Character
	local targetCharacter = selectedTargetPlayer.Character
	local myHumanoid = myCharacter and myCharacter:FindFirstChildOfClass("Humanoid")
	local targetHumanoid = targetCharacter and targetCharacter:FindFirstChildOfClass("Humanoid")
	local myRoot = myCharacter and myCharacter:FindFirstChild("HumanoidRootPart")
	local targetRoot = targetCharacter and targetCharacter:FindFirstChild("HumanoidRootPart")

	if not myRoot or not targetRoot then
		setTeleportStatus("Waiting for both characters to load", true)
		return
	end
	if (myHumanoid and myHumanoid.Health <= 0) or (targetHumanoid and targetHumanoid.Health <= 0) then
		setTeleportStatus("Teleport unavailable while a character is dead", true)
		return
	end

	local destination = targetRoot.CFrame * CFrame.new(0, 0, 4)
	local success, err = pcall(function()
		myCharacter:PivotTo(destination)
	end)
	if success then
		setTeleportStatus("Teleported beside " .. selectedTargetPlayer.DisplayName, false)
	else
		setTeleportStatus("Teleport failed: " .. tostring(err), true)
	end
end)


-- 2. Island & Location Teleport Row (75+ Exact Fisch Locations)
local islandTpRow = Instance.new("Frame")
islandTpRow.Size = UDim2.new(0, 380, 0, 42)
islandTpRow.BackgroundTransparency = 1
islandTpRow.ZIndex = 5
islandTpRow.Parent = tpTab

local islandDropdownBtn = Instance.new("TextButton")
islandDropdownBtn.Size = UDim2.new(0, 230, 1, 0)
islandDropdownBtn.BackgroundColor3 = Color3.fromRGB(6, 16, 32)
islandDropdownBtn.BackgroundTransparency = 1
islandDropdownBtn.ZIndex = 6
islandDropdownBtn.Font = Enum.Font.GothamMedium
islandDropdownBtn.Text = "Fisch Location: Select..."
islandDropdownBtn.TextColor3 = Color3.fromRGB(210, 235, 255)
islandDropdownBtn.TextTransparency = 1
islandDropdownBtn.TextSize = 11
islandDropdownBtn.AutoButtonColor = false
islandDropdownBtn.Parent = islandTpRow

local islandDropCorner = Instance.new("UICorner")
islandDropCorner.CornerRadius = UDim.new(0, 8)
islandDropCorner.Parent = islandDropdownBtn

local islandDropStroke = Instance.new("UIStroke")
islandDropStroke.Color = Color3.fromRGB(0, 200, 255)
islandDropStroke.Transparency = 0.5
islandDropStroke.Thickness = 1
islandDropStroke.Parent = islandDropdownBtn

local tpIslandBtn = Instance.new("TextButton")
tpIslandBtn.Size = UDim2.new(0, 140, 1, 0)
tpIslandBtn.Position = UDim2.new(0, 240, 0, 0)
tpIslandBtn.BackgroundColor3 = Color3.fromRGB(0, 220, 255)
tpIslandBtn.BackgroundTransparency = 1
tpIslandBtn.ZIndex = 6
tpIslandBtn.Font = Enum.Font.GothamBold
tpIslandBtn.Text = "TP Location"
tpIslandBtn.TextColor3 = Color3.fromRGB(2, 6, 14)
tpIslandBtn.TextTransparency = 1
tpIslandBtn.TextSize = 12
tpIslandBtn.AutoButtonColor = false
tpIslandBtn.Parent = islandTpRow

local tpIslandCorner = Instance.new("UICorner")
tpIslandCorner.CornerRadius = UDim.new(0, 8)
tpIslandCorner.Parent = tpIslandBtn

-- Massive precise database of 75+ Fisch locations & islands
local fischIslands = {
	{Name = "Moosewood", CF = CFrame.new(383, 135, 244)},
	{Name = "Sunstone", CF = CFrame.new(-934, 132, -1112)},
	{Name = "Statue of Liberty", CF = CFrame.new(22, 160, -1038)},
	{Name = "Altar", CF = CFrame.new(1310, -802, -82)},
	{Name = "Castaway Cliff", CF = CFrame.new(393, 201, -1797)},
	{Name = "Birch Cay", CF = CFrame.new(1739, 144, -2437)},
	{Name = "Everturn Forest", CF = CFrame.new(2368, 140, -2348)},
	{Name = "Mushgrove Swamp", CF = CFrame.new(2606, 132, -835)},
	{Name = "Carrot Garden", CF = CFrame.new(3724, -1128, -1092)},
	{Name = "Snowcap", CF = CFrame.new(2623, 143, 2467)},
	{Name = "Terrapin", CF = CFrame.new(-230, 142, 1946 )},
	{Name = "Foresaken Shore", CF = CFrame.new(-2486, 134, 1550)},
	{Name = "Foresaken Shore Uphill", CF = CFrame.new(-2875, 317, 1608)},
	{Name = "Grand Reef", CF = CFrame.new(-3544, 144, 487)},
	{Name = "Atlantean Storm", CF = CFrame.new(-3680, 142, 735)},
	{Name = "Atlantis", CF = CFrame.new(-4454, -606, 1851)},
	{Name = "Sunken Trial", CF = CFrame.new(-4775, -596, 1841)},
	{Name = "Sunken Depths", CF = CFrame.new(-4936, -596, 1844)},
	{Name = "Poseidon Trial", CF = CFrame.new(-3689, -548, 1021)},
	{Name = "Poseidon Temple", CF = CFrame.new(-4041, -559, 925)},
	{Name = "Ethereal Abyss", CF = CFrame.new(-3788, -568, 1836)},
	{Name = "Zeus Sanctuary", CF = CFrame.new(-4296, -628, 2682)},
	{Name = "Frenzy Of War", CF = CFrame.new(-8800, -2361, 848)},
	{Name = "Song Of Light", CF = CFrame.new(-8848, -2905, -821)},
	{Name = "Storm Of Flood", CF = CFrame.new(-8892, -3189, 739)},
	{Name = "Thunder Of Chaos", CF = CFrame.new(-8827, -3535, 631)},
	{Name = "Underworld Of Indefinite", CF = CFrame.new(-950, 128, -1220)},
	{Name = "Olympian Fissure", CF = CFrame.new(-8829, -4244, -239)},
	{Name = "Lost Jungle", CF = CFrame.new(-2703, 149, -2060)},
	{Name = "Mossjaw Rest", CF = CFrame.new(-4911, -1791, -10167)},
	{Name = "Ashbrook Town", CF = CFrame.new(-5099, 146, -1495)},
	{Name = "Scoria Reach", CF = CFrame.new(-5130, 157, -1222)},
	{Name = "Scoria Volcano", CF = CFrame.new(-5481, 190, -1559)},
	{Name = "Scoria Volcano Spot 2", CF = CFrame.new(-5535, 258, -1812)},
	{Name = "Scoria Volcano Spot 3", CF = CFrame.new(-5586, 168, -1791)},
	{Name = "Drylands Village", CF = CFrame.new(-6314, 212, -1824)},
	{Name = "Drylands", CF = CFrame.new(-6704, 173, -1298)},
	{Name = "Ancient", CF = CFrame.new(6060, 196, 293)},
	{Name = "Ancient Isle Summit", CF = CFrame.new(6075, 444, 686)},
	{Name = "Ancient Isle Hidden Vault", CF = CFrame.new(-3162, -748, 1691)},
	{Name = "Upper Snowcap", CF = CFrame.new(2820, 281, 2557)},
	{Name = "Blue Moon First Sea", CF = CFrame.new(2734, 135, 2550)},
	{Name = "Skycrest", CF = CFrame.new(2796, 1623, 897)},
	{Name = "Oscar Locker", CF = CFrame.new(196, -395, 3531)},
	{Name = "Northern Summit", CF = CFrame.new(19593, 143, 5308)},
	{Name = "Overgrowth Cave", CF = CFrame.new(20292, 272, 5507)},
	{Name = "Frigid Cavern", CF = CFrame.new(19837, 439, 5609)},
	{Name = "Frigid Cavern Camp", CF = CFrame.new(19760, 416, 5400)},
	{Name = "Overgrowth Cave Rod", CF = CFrame.new(19256, 414, 6001)},
	{Name = "Cyrogenic Canal", CF = CFrame.new(19882, 645, 5646)},
	{Name = "Cyrogenic Canal Rod", CF = CFrame.new(19948, 587, 5559)},
	{Name = "Cyrogenic Canal Cave", CF = CFrame.new(20049, 513, 5425)},
	{Name = "Cyrogenic Canal Camp", CF = CFrame.new(20223, 731, 5683)},
	{Name = "Glacial Glotto Cave", CF = CFrame.new(20032, 989, 5621)},
	{Name = "Glacial Glotto", CF = CFrame.new(19954, 1143, 5559)},
	{Name = "Glacial Glotto Rod", CF = CFrame.new(20024, -468, 7112)},
	{Name = "Boreal  Hollow", CF = CFrame.new(853, -2604, 1607)},
	{Name = "Boreal Pines", CF = CFrame.new(21888, 138, 4158)},
	{Name = "TideFall", CF = CFrame.new(3147, -1101, 767)},
	{Name = "Sunken Reliquary Ruins", CF = CFrame.new(2924, -1108, -121)},
	{Name = "Coral Bastion", CF = CFrame.new(2548, -1099, 848)},
	{Name = "Collapsed Ruins", CF = CFrame.new(3140, -1103, 1625)},
	{Name = "Crowned Ruins", CF = CFrame.new(3138, -1128, 2048)},
	{Name = "TideFall Castle", CF = CFrame.new(3789, -1080, 818)},
	{Name = "Inner TideFall Castle", CF = CFrame.new(4375, -1102, 913)},
	{Name = "The Deep Boat", CF = CFrame.new(-192, 131, -4661)},
	{Name = "The Deep Town", CF = CFrame.new(366, -2240, -11903)},
	{Name = "The Laboratory", CF = CFrame.new(-1909, 225, -501)},
	{Name = "Desolate Deep Merchant", CF = CFrame.new(-988, -245, -2720)},
	{Name = "Desolate Pocket", CF = CFrame.new(-1657, -215, -2844)},
	{Name = "Brine Pool", CF = CFrame.new(-1796, -143, -3413)},
	{Name = "Nectar Den", CF = CFrame.new(-2029, -303, -3229)},
	{Name = "Tridents Temple", CF = CFrame.new(-1483, -227, -2221)},
	{Name = "Tridents Vault", CF = CFrame.new(-1766, -403, -2140)},
	{Name = "Living Garden", CF = CFrame.new(-2399, -318, -2934)},
    {Name = "Toxic Grove", CF = CFrame.new(-2710, -316, -2290)},
    {Name = "The Depths", CF = CFrame.new(941, -716, 1267)},
    {Name = "Crystal Cove", CF = CFrame.new(1374, -604, 2336)},
    {Name = "Underground Music", CF = CFrame.new(2015, -645, 2460)},
    {Name = "Enchanted Crevice", CF = CFrame.new(776, -756, -327)},
    {Name = "The Depths Rod", CF = CFrame.new(1701, -902, 1432)},
    {Name = "Vertigo", CF = CFrame.new(-144, -517, 1156)},
    {Name = "Luminous Cavern", CF = CFrame.new(-1018, -332, -4166)},
    {Name = "Crimson Cavern", CF = CFrame.new(-1028, -363, -4803)},
    {Name = "Volcanic Vents", CF = CFrame.new(-3187, -2039, 4032)},
    {Name = "Challenger's Deep", CF = CFrame.new(769, -3360, -1546)},
    {Name = "Abbysal Zennith", CF = CFrame.new(-13574, -11051, 129)},
    {Name = "Calm Zone Entrance", CF = CFrame.new(-4256, -11201, 1783)},
    {Name = "Calm Zone", CF = CFrame.new(-4370, -11177, 3707)},
    {Name = "Viel Of Forsaken", CF = CFrame.new(-2342, -11184, 7082)}
}

local islandListHolder = Instance.new("ScrollingFrame")
islandListHolder.Size = UDim2.new(0, 230, 0, 0)
islandListHolder.Position = UDim2.new(0, 0, 1, 4)
islandListHolder.BackgroundColor3 = Color3.fromRGB(3, 10, 22)
islandListHolder.BackgroundTransparency = 1
islandListHolder.BorderSizePixel = 0
islandListHolder.Visible = false
islandListHolder.ZIndex = 50
islandListHolder.CanvasSize = UDim2.new(0, 0, 0, #fischIslands * 28)
islandListHolder.Parent = islandTpRow

local islandListLayout = Instance.new("UIListLayout")
islandListLayout.SortOrder = Enum.SortOrder.LayoutOrder
islandListLayout.Parent = islandListHolder

for _, island in ipairs(fischIslands) do
	local iBtn = Instance.new("TextButton")
	iBtn.Size = UDim2.new(1, 0, 0, 28)
	iBtn.BackgroundColor3 = Color3.fromRGB(6, 16, 32)
	iBtn.BackgroundTransparency = 1
	iBtn.ZIndex = 51
	iBtn.Font = Enum.Font.Gotham
	iBtn.Text = island.Name
	iBtn.TextColor3 = Color3.fromRGB(0, 240, 255)
	iBtn.TextSize = 11
	iBtn.TextXAlignment = Enum.TextXAlignment.Left
	iBtn.Parent = islandListHolder
	
	local pad = Instance.new("UIPadding")
	pad.PaddingLeft = UDim.new(0, 8)
	pad.Parent = iBtn
	
	iBtn.MouseButton1Click:Connect(function()
		selectedIslandCF = island.CF
		islandDropdownBtn.Text = "Location: " .. island.Name
				setTeleportStatus("Target locked: " .. p.DisplayName, false)
		TweenService:Create(islandListHolder, TweenInfo.new(0.2), {Size = UDim2.new(0, 230, 0, 0)}):Play()
		task.wait(0.2)
		islandListHolder.Visible = false
	end)
end

islandDropdownBtn.MouseButton1Click:Connect(function()
	if islandListHolder.Visible then
		TweenService:Create(islandListHolder, TweenInfo.new(0.2), {Size = UDim2.new(0, 230, 0, 0)}):Play()
		task.wait(0.2)
		islandListHolder.Visible = false
	else
		islandListHolder.Visible = true
		TweenService:Create(islandListHolder, TweenInfo.new(0.2), {Size = UDim2.new(0, 230, 0, 180)}):Play()
	end
end)

tpIslandBtn.MouseButton1Click:Connect(function()
	if not selectedIslandCF then
		setTeleportStatus("Select a location first", true)
		return
	end
	local character = player.Character
	local root = character and character:FindFirstChild("HumanoidRootPart")
	if not root then
		setTeleportStatus("Your character is still loading", true)
		return
	end
	local success, err = pcall(function()
		character:PivotTo(selectedIslandCF + Vector3.new(0, 4, 0))
	end)
	setTeleportStatus(success and "Teleported to selected location" or "Location teleport failed: " .. tostring(err), not success)
end)



-- SETTINGS TAB & KEYBINDS

local settingsTab = tabs["Settings"]
local toggleKey = Enum.KeyCode.M

createButton(settingsTab, "Rejoin Current Server", function()
	local success, err = pcall(function()
		TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
	end)
	if not success then
		setTeleportStatus("Rejoin failed: " .. tostring(err), true)
	end
end)

createButton(settingsTab, "Server Hop (New Instance)", function()
	local servers = {}
	local success = pcall(function()
		servers = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")).data
	end)
	if success and servers then
		for _, s in ipairs(servers) do
			if s.playing < s.maxPlayers and s.id ~= game.JobId then
				TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id, player)
				break
			end
		end
	end
end)

local antiAfkActive = false
createToggle(settingsTab, "Anti-AFK System", function(state) antiAfkActive = state end)

task.spawn(function()
	while scriptActive do
		task.wait(60)
		if antiAfkActive then
			local vu = game:GetService("VirtualUser")
			vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
			task.wait(1)
			vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
		end
	end
end)

local keyContainer = Instance.new("Frame")
keyContainer.Size = UDim2.new(0, 380, 0, 38)
keyContainer.BackgroundTransparency = 1
keyContainer.Parent = settingsTab

local keyLabel = Instance.new("TextLabel")
keyLabel.Size = UDim2.new(1, -110, 1, 0)
keyLabel.Position = UDim2.new(0, 4, 0, 0)
keyLabel.BackgroundTransparency = 1
keyLabel.Font = Enum.Font.GothamMedium
keyLabel.Text = "PC Menu Toggle Keybind"
keyLabel.TextColor3 = Color3.fromRGB(210, 235, 255)
keyLabel.TextTransparency = 1
keyLabel.TextSize = 12
keyLabel.TextXAlignment = Enum.TextXAlignment.Left
keyLabel.Parent = keyContainer

local keyButton = Instance.new("TextButton")
keyButton.Size = UDim2.new(0, 95, 0, 28)
keyButton.Position = UDim2.new(1, -103, 0.5, -14)
keyButton.BackgroundColor3 = Color3.fromRGB(8, 20, 38)
keyButton.BackgroundTransparency = 1
keyButton.Font = Enum.Font.GothamBold
keyButton.Text = toggleKey.Name
keyButton.TextColor3 = Color3.fromRGB(0, 240, 255)
keyButton.TextTransparency = 1
keyButton.TextSize = 11
keyButton.AutoButtonColor = false
keyButton.Parent = keyContainer

local keyBtnCorner = Instance.new("UICorner")
keyBtnCorner.CornerRadius = UDim.new(0, 6)
keyBtnCorner.Parent = keyButton

local isListeningForKey = false
keyButton.MouseButton1Click:Connect(function()
	if isListeningForKey then return end
	isListeningForKey = true
	keyButton.Text = "Press Key..."
	local connection
	connection = UserInputService.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Keyboard then
			toggleKey = input.KeyCode
			keyButton.Text = toggleKey.Name
			isListeningForKey = false
			connection:Disconnect()
		end
	end)
end)



-- 3. MOBILE TOGGLE BUTTON WITH MATCHING DECAL ID

local MobileButton = Instance.new("ImageButton")
MobileButton.Name = "MobileToggle"
MobileButton.Size = UDim2.new(0, 54, 0, 54)
MobileButton.Position = UDim2.new(0, 20, 0.5, -27)
MobileButton.BackgroundColor3 = Color3.fromRGB(4, 16, 32)
MobileButton.BackgroundTransparency = 1
MobileButton.Image = DecalId
MobileButton.ImageTransparency = 1
MobileButton.AutoButtonColor = false
MobileButton.Visible = false
MobileButton.Parent = ScreenGui

local MobCorner = Instance.new("UICorner")
MobCorner.CornerRadius = UDim.new(1, 0)
MobCorner.Parent = MobileButton

local MobStroke = Instance.new("UIStroke")
MobStroke.Color = Color3.fromRGB(0, 240, 255)
MobStroke.Thickness = 2
MobStroke.Transparency = 1
MobStroke.Parent = MobileButton



-- INTRO FADE-IN & LAUNCH SEQUENCE

task.spawn(function()
	task.wait(0.2)
	if not scriptActive then return end
	BarFill:TweenSize(UDim2.new(1, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 1.2, true)
	task.wait(1.3)
	if not scriptActive then return end
	local success = pcall(function()
		IntroGui:Destroy()
		MainFrame.Visible = true
		MobileButton.Visible = true

		local fadeInInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		TweenService:Create(MainFrame, fadeInInfo, {BackgroundTransparency = 0}):Play()
		TweenService:Create(MainStroke, fadeInInfo, {Transparency = 0}):Play()
		TweenService:Create(TopBar, fadeInInfo, {BackgroundTransparency = 0}):Play()
		TweenService:Create(TitleLabel, fadeInInfo, {TextTransparency = 0}):Play()
		TweenService:Create(CloseButton, fadeInInfo, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
		TweenService:Create(MobileButton, fadeInInfo, {BackgroundTransparency = 0, ImageTransparency = 0}):Play()
		TweenService:Create(MobStroke, fadeInInfo, {Transparency = 0}):Play()

		for _, data in pairs(tabButtons) do
			TweenService:Create(data.Button, fadeInInfo, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
		end
		for _, tab in pairs(tabs) do
			for _, child in ipairs(tab:GetDescendants()) do
				if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
					TweenService:Create(child, fadeInInfo, {TextTransparency = 0}):Play()
				elseif child:IsA("Frame") then
					TweenService:Create(child, fadeInInfo, {BackgroundTransparency = 0}):Play()
				end
			end
		end
	end)

	if not success and scriptActive then
		IntroGui:Destroy()
		MainFrame.Visible = true
		MobileButton.Visible = true
	end
end)

task.delay(4, function()
	if scriptActive and IntroGui.Parent then
		IntroGui:Destroy()
		MainFrame.Visible = true
		MobileButton.Visible = true
	end
end)



-- GAME ENGINE LOOPS & SOLID SURFACE WATER ENGINE (NO BOUNCE)   

local isOpen = true
local function toggleUI()
	isOpen = not isOpen
	MainFrame.Visible = isOpen
end

MobileButton.MouseButton1Click:Connect(toggleUI)

UserInputService.InputBegan:Connect(function(input, gp)
	if gp or isListeningForKey then return end
	if input.KeyCode == toggleKey then
		toggleUI()
	elseif ctrlTpEnabled and input.UserInputType == Enum.UserInputType.MouseButton1 and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			player.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
		end
	end
end)

local flyPart = nil
local waterPlatform = nil

RunService.RenderStepped:Connect(function()
		if not scriptActive then return end
	local char = player.Character
	if not char then return end
	local hum = char:FindFirstChild("Humanoid")
	local root = char:FindFirstChild("HumanoidRootPart")
	
	if hum and root then
		if hum.WalkSpeed ~= currentSpeed then hum.WalkSpeed = currentSpeed end
		if hum.JumpPower ~= currentJump then hum.UseJumpPower = true hum.JumpPower = currentJump end

		if flyEnabled then
			if not flyPart then
				flyPart = Instance.new("BodyVelocity")
				flyPart.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				flyPart.Parent = root
			end
			local cam = workspace.CurrentCamera
			local moveDir = Vector3.new()
			if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.CFrame.LookVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.CFrame.LookVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.CFrame.RightVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.CFrame.RightVector end
			flyPart.Velocity = moveDir * flySpeed
			hum.PlatformStand = true
		else
			if flyPart then flyPart:Destroy() flyPart = nil end
			hum.PlatformStand = false
		end

		-- Solid Surface Walk Water Engine (Zero Bounce / Smooth Platform Simulation)
		if walkWaterEnabled then
			if root.Position.Y < 134 then
				if not waterPlatform then
					waterPlatform = Instance.new("Part")
					waterPlatform.Name = "WaterWalkSurface"
					waterPlatform.Size = Vector3.new(12, 1, 12)
					waterPlatform.Anchored = true
					waterPlatform.Transparency = 1
					waterPlatform.CanCollide = true
					waterPlatform.Parent = workspace
				end
				waterPlatform.CFrame = CFrame.new(root.Position.X, 131.5, root.Position.Z)
			else
				if waterPlatform then waterPlatform:Destroy() waterPlatform = nil end
			end
		else
			if waterPlatform then waterPlatform:Destroy() waterPlatform = nil end
		end

		if noclipEnabled then
			for _, p in ipairs(char:GetDescendants()) do
				if p:IsA("BasePart") then p.CanCollide = false end
			end
		end
	end
end)

UserInputService.JumpRequest:Connect(function()
	if infJumpEnabled and player.Character and player.Character:FindFirstChild("Humanoid") then
		player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

-- Player ESP Renderer
local espCache = {}
RunService.RenderStepped:Connect(function()
		if not scriptActive then return end
	if not _G.PlayerEspEnabled then
		for _, gui in pairs(espCache) do if gui then gui:Destroy() end end
		espCache = {}
		return
	end

	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
			local hrp = p.Character.HumanoidRootPart
			local localHrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
			if localHrp then
				local dist = math.floor((hrp.Position - localHrp.Position).Magnitude)
				if not espCache[p] then
					local bg = Instance.new("BillboardGui")
					bg.Name = "ESP"
					bg.Size = UDim2.new(0, 100, 0, 40)
					bg.AlwaysOnTop = true
					bg.StudsOffset = Vector3.new(0, 2.5, 0)
					
					local lbl = Instance.new("TextLabel")
					lbl.Size = UDim2.new(1, 0, 1, 0)
					lbl.BackgroundTransparency = 1
					lbl.Font = Enum.Font.GothamBold
					lbl.TextColor3 = Color3.fromRGB(0, 240, 255)
					lbl.TextSize = 11
					lbl.Parent = bg
					
					bg.Parent = hrp
					espCache[p] = bg
				end
				local label = espCache[p]:FindFirstChildOfClass("TextLabel")
				if label then label.Text = p.Name .. " [" .. dist .. "m]" end
			end
		else
			if espCache[p] then espCache[p]:Destroy() espCache[p] = nil end
		end
	end
end)

-- Mobile Button Dragging Support
local mDragging, mDragStart, mStartPos
MobileButton.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		mDragging = true
		mDragStart = input.Position
		mStartPos = MobileButton.Position
	end
end)
UserInputService.InputChanged:Connect(function(input)
	if mDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - mDragStart
		MobileButton.Position = UDim2.new(mStartPos.X.Scale, mStartPos.X.Offset + delta.X, mStartPos.Y.Scale, mStartPos.Y.Offset + delta.Y)
	end
end)
UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		mDragging = false
	end
end)

local function destroyGui()
	if not scriptActive then return end
	scriptActive = false
	flyEnabled = false
	noclipEnabled = false
	walkWaterEnabled = false
	infJumpEnabled = false
	ctrlTpEnabled = false
	antiAfkActive = false
	_G.PlayerEspEnabled = false

	if flyPart then
		flyPart:Destroy()
		flyPart = nil
	end
	if waterPlatform then
		waterPlatform:Destroy()
		waterPlatform = nil
	end
	for trackedPlayer, gui in pairs(espCache) do
		if gui then gui:Destroy() end
		espCache[trackedPlayer] = nil
	end

	local character = player.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid.PlatformStand = false
		humanoid.WalkSpeed = 16
		humanoid.JumpPower = 50
	end
	if character then
		for _, part in ipairs(character:GetDescendants()) do
			if part:IsA("BasePart") then part.CanCollide = true end
		end
	end

	ScreenGui:Destroy()
	if IntroGui.Parent then IntroGui:Destroy() end
end

CloseButton.MouseButton1Click:Connect(destroyGui)
