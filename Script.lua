getgenv().SecureMode = true
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Sweet BloxFruit Script",
   LoadingTitle = "Sweet Games",
   LoadingSubtitle = "by Bassam",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Sweet HUB"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true 
   },
   KeySystem = false, 
   KeySettings = {
      Title = "Key | Sweet BloxFruit Script",
      Subtitle = "Key System",
      Note = "click the button to copy the key link",
      FileName = "Sweet Games Key",
 file
      SaveKey = true, 
      GrabKeyFromSite = true,
      Key = {"SweetScriptsOnTop!"} 
   }
})

local MainTab = Window:CreateTab("Main", NIL) -- Title, Image
local MainSection = MainTab:CreateSection("Main")
 local toolDropdown = MainSection:NewDropdown("Weapon", "Choose your tool to use!", tools, function(weapon)
        end)
game.Players.LocalPlayer.Backpack.DescendantAdded:Connect(function(tool)
	local toolName = tool.Name
	if tool:IsA("Tool") then
		table.insert(tools, toolName)
		toolDropdown:Refresh(tools)
	end
end)
game.Players.LocalPlayer.Backpack.DescendantRemoving:Connect(function(tool)
	local toolName = tool.Name
	if tool:IsA("Tool") then
		for i,v in pairs(tools) do
			if v == toolName then
				table.remove(tools, i)
			end
		end	
	end
	toolDropdown:Refresh(tools)
end)

local Button = MainTab:CreateButton({
   Name = "AutoFarm",
   Callback = function()
  function CheckQuest()
	local Lv = game.Players.LocalPlayer.Data.Level.Value
	 if Lv == 0 or Lv <= 10 then
	 Ms = "Bandit [Lv. 5]"
	 NM = "Bandit"
	 LQ = 1
	 NQ = "BanditQuest1"
	 CQ = CFrame.new(1062.64697265625, 16.516624450683594, 1546.55224609375)
	 end
 end
 function TP(P)
	 Distance = (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	 if Distance < 10 then
		 Speed = 1000
	 elseif Distance < 170 then
		 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
		 Speed = 350
	 elseif Distance < 1000 then
		 Speed = 350
	 elseif Distance >= 1000 then
		 Speed = 300
	 end
	 game:GetService("TweenService"):Create(
		 game.Players.LocalPlayer.Character.HumanoidRootPart,
		 TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
		 {CFrame = P}
	 ):Play()
 end
 
 spawn(function()
	while task.wait() do
		if _G.AutoFarm then
			CheckQuest()
			if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				 TP(CQ)
				 task.wait(0.9)
				 game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NQ,LQ)
				 elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					 for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						 if v.Name == Ms then
						 TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
						 v.HumanoidRootPart.Size = Vector3.new(60,60,60)
					 end
				 end
			 end
		 end
	 end
 end)
 spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
		if _G.AutoFarm then
		pcall(function()
                game:GetService'VirtualUser':CaptureController()
			    game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
            end)
        end
    end)
end)

   end,
})
