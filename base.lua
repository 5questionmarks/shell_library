
local shell_lib = {}

function shell_lib:CreateLib()

	local createtab = {}

	local shell = Instance.new("ScreenGui")
	local structure = Instance.new("Frame")
	local pagebar = Instance.new("Frame")
	local logo = Instance.new("ImageLabel")
	local pages = Instance.new("Frame")
	local UIListLayout_Main = Instance.new("UIListLayout")
	local pagecontents = Instance.new("Frame")
	local pagelabel = Instance.new("TextLabel")

	shell.Name = "shell"
	shell.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	shell.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	shell.ResetOnSpawn = false

	structure.Name = "structure"
	structure.Parent = shell
	structure.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	structure.BorderSizePixel = 0
	structure.Position = UDim2.new(0.185840741, 0, 0.326136351, 0)
	structure.Size = UDim2.new(0, 451, 0, 265)

	pagebar.Name = "pagebar"
	pagebar.Parent = structure
	pagebar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	pagebar.BorderSizePixel = 0
	pagebar.Size = UDim2.new(0, 102, 0, 265)

	logo.Name = "logo"
	logo.Parent = pagebar
	logo.BackgroundColor3 = Color3.fromRGB(255, 67, 70)
	logo.BackgroundTransparency = 1.000
	logo.Position = UDim2.new(0.35425961, 0, 0.107643418, 0)
	logo.Size = UDim2.new(0, 25, 0, 26)
	logo.Image = "rbxassetid://8740468302"

	pages.Name = "pages"
	pages.Parent = pagebar
	pages.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	pages.BackgroundTransparency = 1.000
	pages.BorderColor3 = Color3.fromRGB(27, 42, 53)
	pages.Position = UDim2.new(0, 0, 0.301886797, 0)
	pages.Size = UDim2.new(0, 96, 0, 185)

	UIListLayout_Main.Name = "UIListLayout_Main"
	UIListLayout_Main.Parent = pages
	UIListLayout_Main.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout_Main.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_Main.Padding = UDim.new(0, 5)

	pagecontents.Name = "pagecontents"
	pagecontents.Parent = structure
	pagecontents.Active = true
	pagecontents.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	pagecontents.BackgroundTransparency = 1.000
	pagecontents.Position = UDim2.new(0.204081625, 0, 0, 0)
	pagecontents.Size = UDim2.new(0, 355, 0, 265)
	local uis = game:GetService("UserInputService")
	
	uis.InputBegan:Connect(function(key, chat)
		if key.KeyCode == Enum.KeyCode.RightControl then
			if structure.Visible == true then
				structure.Visible = false
			else
				structure.Visible = true
			end
		end
	end)

	pagelabel.Name = "pagelabel"
	pagelabel.Parent = structure
	pagelabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	pagelabel.BorderSizePixel = 0
	pagelabel.Position = UDim2.new(0.204662919, 0, 0, 0)
	pagelabel.Size = UDim2.new(0, 358, 0, 50)
	pagelabel.Font = Enum.Font.GothamSemibold
	pagelabel.Text = "discord.gg/7Dxa8FQpGa"
	pagelabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	pagelabel.TextSize = 13.000

	function createtab:CreateTab(tabname,number)
		local innertab = {}
		local tabpage = Instance.new("ImageButton")
		local tabpagename = Instance.new("TextLabel")
		local page_example = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		local title_frame = Instance.new("Frame")
		local title_text = Instance.new("TextLabel")
		local tabitems = {}

		function innertab:CreateSlider(name,maxvalue,minvalue,callval)

			local slider_frame = Instance.new("Frame")
			local slider_title = Instance.new("TextLabel")
			local slider = Instance.new("Frame")
			local sliderbtn = Instance.new("ImageButton")
			local value;

			--Properties:

			slider_frame.Name = "slider_frame"
			slider_frame.Parent = page_example
			slider_frame.Active = true
			slider_frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			slider_frame.BorderSizePixel = 0
			slider_frame.Position = UDim2.new(0.0427350439, 0, 0.44230783, 0)
			slider_frame.Size = UDim2.new(0, 321, 0, 79)

			slider_title.Name = "slider_title"
			slider_title.Parent = slider_frame
			slider_title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			slider_title.BackgroundTransparency = 1.000
			slider_title.BorderSizePixel = 0
			slider_title.Position = UDim2.new(0.0273556225, 0, 0, 0)
			slider_title.Size = UDim2.new(0, 172, 0, 41)
			slider_title.Font = Enum.Font.GothamSemibold
			slider_title.Text = name or "Untitled"
			slider_title.TextColor3 = Color3.fromRGB(255, 255, 255)
			slider_title.TextSize = 12.000
			slider_title.TextXAlignment = Enum.TextXAlignment.Left

			slider.Name = "slider"
			slider.Parent = slider_frame
			slider.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			slider.BorderSizePixel = 0
			slider.Position = UDim2.new(0.0267446171, 0, 0.55595994, 0)
			slider.Size = UDim2.new(0, 305, 0, 21)

			sliderbtn.Name = "sliderbtn"
			sliderbtn.Parent = slider
			sliderbtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			sliderbtn.BorderSizePixel = 0
			sliderbtn.Size = UDim2.new(0, 20, 0, 21)
			sliderbtn.ZIndex = 0
			sliderbtn.Image = "rbxassetid://8543726385"
			sliderbtn.ImageColor3 = Color3.fromRGB(45, 45, 45)

			-- Scripts:

			local function WVHITY_fake_script() -- slider.manager 
				local script = Instance.new('LocalScript', slider)

				local UIS = game:GetService("UserInputService")
				local dragging = false

				script.Parent.sliderbtn.MouseButton1Down:Connect(function()
					dragging = true
				end)

				UIS.InputChanged:Connect(function()
					if dragging then
						local mousepos = UIS:GetMouseLocation()+Vector2.new(0,23)
						local relpos = mousepos-script.Parent.AbsolutePosition
						local percent = math.clamp(relpos.X/script.Parent.AbsoluteSize.X,0,0.935)
						local sliderbtn = script.Parent.sliderbtn
						--script.Parent.SliderButton.Position = UDim2.new(Percent,0,0,0)
						local dragspeed = 0.2
						game:GetService('TweenService'):Create(sliderbtn, TweenInfo.new(dragspeed), {Position = UDim2.new(percent,0,0,0)}):Play()

						maxvalue = maxvalue or 500
						minvalue = minvalue or 16

						value = math.floor((((tonumber(maxvalue) - tonumber(minvalue))) * percent) + tonumber(minvalue))

						pcall(function()
							callval(value)
						end)
					end
				end)

				UIS.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = false
					end
				end)
			end
			coroutine.wrap(WVHITY_fake_script)()
		end
		
		function innertab:CreateDropDown(name,list,callback)
			
			callback = callback or function() end
			
			list = list or {}
			
			local dropdown_frame = Instance.new("Frame")
			local drop_title = Instance.new("TextLabel")
			local drop = Instance.new("ScrollingFrame")
			local UIListLayout = Instance.new("UIListLayout")
			local holder = Instance.new("Frame")
			local dropdownbtn = Instance.new("ImageButton")
			
			local dropitem = Instance.new("ImageButton")
			--Properties:
			
			
			
			for i,v in next, list do
				local dropitem = Instance.new("ImageButton")
				local drop_label = Instance.new("TextLabel")
				
				dropitem.Name = "dropitem"
				dropitem.Parent = drop
				dropitem.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				dropitem.BackgroundTransparency = 1.000
				dropitem.BorderSizePixel = 0
				dropitem.Position = UDim2.new(0, 0, -0.165000007, 0)
				dropitem.Size = UDim2.new(0, 288, 0, 31)
				dropitem.Image = "rbxassetid://8740520481"
				dropitem.ImageColor3 = Color3.fromRGB(35, 35, 35)

				drop_label.Name = "drop_label"
				drop_label.Parent = dropitem
				drop_label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				drop_label.BackgroundTransparency = 1.000
				drop_label.Size = UDim2.new(0, 288, 0, 31)
				drop_label.Font = Enum.Font.GothamSemibold
				drop_label.Text = v
				drop_label.TextColor3 = Color3.fromRGB(255, 255, 255)
				drop_label.TextSize = 12.000
				
				dropitem.MouseButton1Click:Connect(function()
					callback(v)
				end)
			end
			
			dropdown_frame.Name = "dropdown_frame"
			dropdown_frame.Parent = page_example
			dropdown_frame.Active = true
			dropdown_frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			dropdown_frame.BorderSizePixel = 0
			dropdown_frame.Visible = true
			dropdown_frame.Position = UDim2.new(0.0427350439, 0, 0.44230783, 0)
			dropdown_frame.Size = UDim2.new(0, 321, 0, 40)

			drop_title.Name = "drop_title"
			drop_title.Parent = dropdown_frame
			drop_title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			drop_title.BackgroundTransparency = 1.000
			drop_title.BorderSizePixel = 0
			drop_title.Position = UDim2.new(0.0273556225, 0, 0, 0)
			drop_title.Size = UDim2.new(0, 172, 0, 41)
			drop_title.Font = Enum.Font.GothamSemibold
			drop_title.Text = name
			drop_title.TextColor3 = Color3.fromRGB(255, 255, 255)
			drop_title.TextSize = 12.000
			drop_title.TextXAlignment = Enum.TextXAlignment.Left

			drop.Name = "drop"
			drop.Parent = dropdown_frame
			drop.Active = true
			drop.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			drop.BackgroundTransparency = 1.000
			drop.BorderSizePixel = 0
			drop.ScrollBarImageColor3 = Color3.fromRGB(45,45,45)
			drop.Position = UDim2.new(0.0273556337, 0, 0.379629523, 0)
			drop.Size = UDim2.new(0, 304, 0, 0)
			drop.BottomImage = "rbxassetid://8740520481"
			drop.MidImage = "rbxassetid://8740520481"
			drop.ScrollBarThickness = 0
			drop.TopImage = "rbxassetid://8740520481"

			UIListLayout.Parent = drop
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 5)
			
			local ready = false
			
			local function SEWNY_fake_script() -- dropdownbtn.manage 
				local script = Instance.new('LocalScript', dropdownbtn)

				local dropframe = dropdown_frame
				local drop = drop
				local dropitem = dropitem
			
				script.Parent.MouseButton1Click:Connect(function()
					if ready == false then
						ready = true
						for i,v in next,drop:GetChildren() do
							if v.Name == "dropitem" then
								v:TweenSize(UDim2.new(0, 288,0, 31), "Out", "Sine", 0.3, true)
							end
						end
						drop.ScrollBarThickness = 8
						dropframe:TweenSize(UDim2.new(0, 321,0, 150), "Out", "Sine", 0.3, true)
						drop:TweenSize(UDim2.new(0, 304,0, 85), "Out", "Sine", 0.3, true)
					else
						for i,v in next,drop:GetChildren() do
							if v.Name == "dropitem" then
								v:TweenSize(UDim2.new(0, 288,0, 0), "Out", "Sine", 0.3, true)
							end
						end
						drop.ScrollBarThickness = 0
						dropframe:TweenSize(UDim2.new(0, 321,0, 40), "Out", "Sine", 0.3, true)
						drop:TweenSize(UDim2.new(0, 304,0, 0), "Out", "Sine", 0.3, true)
						ready = false
					end
				end)
			end
			coroutine.wrap(SEWNY_fake_script)()
			
			holder.Name = "holder"
			holder.Parent = dropdown_frame
			holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			holder.BackgroundTransparency = 1.000
			holder.Size = UDim2.new(0, 320, 0, 50)

			dropdownbtn.Name = "dropdownbtn"
			dropdownbtn.Parent = holder
			dropdownbtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			dropdownbtn.BackgroundTransparency = 1.000
			dropdownbtn.BorderSizePixel = 0
			dropdownbtn.ClipsDescendants = true
			dropdownbtn.Position = UDim2.new(0.929374993, 0, 0, 0)
			dropdownbtn.Size = UDim2.new(0, 16, 0, 41)
			dropdownbtn.ZIndex = 0
			dropdownbtn.Image = "rbxassetid://8740520481"
			dropdownbtn.ImageColor3 = Color3.fromRGB(45, 45, 45)
			dropdownbtn.ScaleType = Enum.ScaleType.Fit
			dropdownbtn.SliceScale = 0.000
		end
		
		function innertab:CreateCheckBox(name,callback)
			local checkbox_frame = Instance.new("Frame")
			local checkbox_title = Instance.new("TextLabel")
			local checkbox = Instance.new("ImageButton")

			--Properties:

			checkbox_frame.Name = "checkbox_frame"
			checkbox_frame.Parent = page_example
			checkbox_frame.Active = true
			checkbox_frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			checkbox_frame.BorderSizePixel = 0
			checkbox_frame.Position = UDim2.new(0.0313390307, 0, 0, 0)
			checkbox_frame.Size = UDim2.new(0, 321, 0, 41)

			checkbox_title.Name = "checkbox_title"
			checkbox_title.Parent = checkbox_frame
			checkbox_title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			checkbox_title.BackgroundTransparency = 1.000
			checkbox_title.BorderSizePixel = 0
			checkbox_title.Position = UDim2.new(0.0273556225, 0, 0, 0)
			checkbox_title.Size = UDim2.new(0, 172, 0, 41)
			checkbox_title.Font = Enum.Font.GothamSemibold
			checkbox_title.Text = name
			checkbox_title.TextColor3 = Color3.fromRGB(255, 255, 255)
			checkbox_title.TextSize = 12.000
			checkbox_title.TextXAlignment = Enum.TextXAlignment.Left

			checkbox.Name = "checkbox"
			checkbox.Parent = checkbox_frame
			checkbox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			checkbox.BackgroundTransparency = 1.000
			checkbox.BorderSizePixel = 0
			checkbox.ClipsDescendants = true
			checkbox.Position = UDim2.new(0.929374993, 0, 0, 0)
			checkbox.Size = UDim2.new(0, 16, 0, 41)
			checkbox.ZIndex = 0
			checkbox.Image = "rbxassetid://8740520481"
			checkbox.ImageColor3 = Color3.fromRGB(255, 79, 79)
			checkbox.ScaleType = Enum.ScaleType.Fit
			checkbox.SliceScale = 0.000

			callback = callback or function() end
			

			local function VXMIPL_fake_script() -- checkbox.manage 
				local script = Instance.new('LocalScript', checkbox)

				local enabled = false
				script.Parent.MouseButton1Click:Connect(function()
					if enabled == false then
						enabled = true
						local speed = 0.2
						local tf = TweenInfo.new(speed, Enum.EasingStyle.Sine , Enum.EasingDirection.In, 0)
						local ts = game:GetService("TweenService")
						local checktrue = Color3.fromRGB(144,255,96)	
						ts:Create(script.Parent,tf, {ImageColor3 = checktrue}):Play()
					else
						enabled = false 
						local speed = 0.2
						local tf = TweenInfo.new(speed, Enum.EasingStyle.Sine , Enum.EasingDirection.Out, 0)
						local ts = game:GetService("TweenService")
						local checkfalse = Color3.fromRGB(255,79,79)	
						ts:Create(script.Parent,tf, {ImageColor3 = checkfalse}):Play()
					end
					pcall(callback,enabled)
				end)
			end
			coroutine.wrap(VXMIPL_fake_script)()
		end
		
		function innertab:CreateButton(name,callback)
			local button_frame = Instance.new("ImageButton")
			local button_title = Instance.new("TextLabel")

			button_frame.Name = name
			button_frame.Parent = page_example
			button_frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			button_frame.BackgroundTransparency = 1.000
			button_frame.BorderSizePixel = 0
			button_frame.Size = UDim2.new(0, 321, 0, 41)
			button_frame.Image = "rbxassetid://8740520481"
			button_frame.ImageColor3 = Color3.fromRGB(40, 40, 40)

			button_title.Name = "button_title"
			button_title.Parent = button_frame
			button_title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			button_title.BackgroundTransparency = 1.000
			button_title.BorderSizePixel = 0
			button_title.Position = UDim2.new(0.0273556225, 0, 0, 0)
			button_title.Size = UDim2.new(0, 172, 0, 41)
			button_title.Font = Enum.Font.GothamSemibold
			button_title.Text = name
			button_title.TextColor3 = Color3.fromRGB(255, 255, 255)
			button_title.TextSize = 12.000
			button_title.TextXAlignment = Enum.TextXAlignment.Left

			local function YZXT_fake_script() -- button_frame.anim 
				local script = Instance.new('LocalScript', button_frame)

				script.Parent.MouseEnter:Connect(function()
					local tweenservice = game:GetService('TweenService')
					local animspeed = 0.2
					local tweenfunc = TweenInfo.new(animspeed, Enum.EasingStyle.Linear , Enum.EasingDirection.Out, 0)
					local entered = 0.5
					game:GetService('TweenService'):Create(script.Parent, TweenInfo.new(animspeed), {ImageTransparency = entered}):Play()
				end)

				script.Parent.MouseButton1Click:Connect(function()
					pcall(callback)
				end)		

				script.Parent.MouseLeave:Connect(function()
					local tweenservice = game:GetService('TweenService')
					local animspeed = 0.2
					local tweenfunc = TweenInfo.new(animspeed, Enum.EasingStyle.Linear , Enum.EasingDirection.Out, 0)
					local left = 0
					game:GetService('TweenService'):Create(script.Parent, TweenInfo.new(animspeed), {ImageTransparency = left}):Play()
				end)
			end
			coroutine.wrap(YZXT_fake_script)()
		end

		UIListLayout.Name = "UI_Layout"
		UIListLayout.Parent = page_example
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 5)

		page_example.Name = tabname
		page_example.Parent = pagecontents
		page_example.Active = true
		page_example.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		page_example.BackgroundTransparency = 1.000
		page_example.BorderSizePixel = 0
		--UDim2.new(0,0,number,0)
		page_example.CanvasSize =UDim2.new(0,0,number,0)
		page_example.Position = UDim2.new(0, 0, 0.210999995, 0)
		page_example.Size = UDim2.new(0, 351, 0, 208)
		page_example.ScrollBarThickness = 9
		page_example.ScrollingEnabled = true
		page_example.Visible = false
		page_example.ScrollBarImageColor3 = Color3.fromRGB(40,40,40)
		page_example.TopImage = "rbxassetid://8740520481"

		title_frame.Name = "title_frame"
		title_frame.Parent = page_example
		title_frame.Active = true
		title_frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		title_frame.BorderSizePixel = 0
		title_frame.Position = UDim2.new(0.0313390307, 0, 0, 0)
		title_frame.Size = UDim2.new(0, 321, 0, 41)

		title_text.Name = "title_text"
		title_text.Parent = title_frame
		title_text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		title_text.BackgroundTransparency = 1.000
		title_text.BorderSizePixel = 0
		title_text.Size = UDim2.new(0, 325, 0, 41)
		title_text.Font = Enum.Font.GothamSemibold
		title_text.Text = tabname
		title_text.TextColor3 = Color3.fromRGB(255, 255, 255)
		title_text.TextSize = 12.000

		tabpage.Name = "tabpage"
		tabpage.Parent = pages
		tabpage.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
		tabpage.BackgroundTransparency = 1.000
		tabpage.Position = UDim2.new(0.137362644, 0, 0, 0)
		tabpage.Size = UDim2.new(0, 69, 0, 34)
		tabpage.Image = "rbxassetid://8740520481"
		tabpage.ImageColor3 = Color3.fromRGB(45, 45, 45)

		tabpagename.Name = "tabpagename"
		tabpagename.Parent = tabpage
		tabpagename.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		tabpagename.BackgroundTransparency = 1.000
		tabpagename.Size = UDim2.new(0, 69, 0, 34)
		tabpagename.Font = Enum.Font.GothamSemibold
		tabpagename.Text = tabname
		tabpagename.TextColor3 = Color3.fromRGB(255, 255, 255)
		tabpagename.TextSize = 12.000

		tabpage.MouseButton1Click:Connect(function()
			for i,v in next, pagecontents:GetChildren() do
				v.Visible = false
			end 
			print(math.random() .. ": " .. page_example.Name)
			page_example.Visible = true
			--title_text.Text = tostring(page_example.Name)
		end)


		return innertab
	end

	local function CreateDrag()
		local UIS = game:GetService('UserInputService')
		local frame = structure
		local dragToggle = nil
		local dragSpeed = 0.09
		local dragStart = nil
		local startPos = nil

		local function updateInput(input)
			local delta = input.Position - dragStart
			local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
				startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
		end

		frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
				dragToggle = true
				dragStart = input.Position
				startPos = frame.Position
				local TweenService = game:GetService('TweenService')
				local Speed = 0.2
				local TweenFunc = TweenInfo.new(Speed, Enum.EasingStyle.Linear , Enum.EasingDirection.Out, 0)
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)

		UIS.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				if dragToggle then
					updateInput(input)
				end
			end
		end)
	end
	CreateDrag()
	return createtab
end

return shell_lib
