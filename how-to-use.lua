--{ how to setup lib }--

local Shell = loadstring(game:HttpGet("https://raw.githubusercontent.com/5questionmarks/shell_library/main/base.lua"))()

local Shell_LIB = Shell:CreateLib("Test")

--{ how to make tabpage}--

local TestPage = Shell_LIB:CreateTab("Test",2) --number = canvas size

--{ how to make checkbox }--

TestPage:CreateCheckBox("Test CheckBox",function(toggle)
    if toggle then
        print('true')
    else
        print('false')
    end
end)

--{ how to make slider }--

TestPage:CreateSlider("Test Slider",100,16,function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

--{ how to make button }--

TestPage:CreateButton("Test Button",function()
    print('Clicked')
end)

--{ how to make dropdown }--

TestPage:CreateDropDown("Test DropDown",{"first","second"},function(arg)
    if arg == "first" then
        print('a')
    end
    if arg == "second" then
        print('b')
    end
end)
