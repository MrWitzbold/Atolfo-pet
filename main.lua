local localPlayer = game.Players.LocalPlayer

local astolfo = Instance.new("Part")
astolfo.Parent = workspace
astolfo.Size = Vector3.new(1, 4.75, 1)
astolfo.Anchored = true
astolfo.Position = Vector3.new(0, 2.5, 0)
astolfo.Name = "Astolfo"
astolfo.Anchored = false
astolfo.CanCollide = false
astolfo.Locked = true

local mesh = Instance.new("FileMesh")
mesh.MeshId = "rbxassetid://3278819081"
mesh.TextureId = "rbxassetid://3278819251"
mesh.Offset = Vector3.new(0, 0, 0)
mesh.Scale = Vector3.new(0.12, 0.1, 0.14)
mesh.VertexColor = Vector3.new(1, 1, 1)
mesh.Parent = astolfo

local astolfo_attachment = Instance.new("Attachment")
astolfo_attachment.Parent = astolfo

local head_attachment = Instance.new("Attachment")
head_attachment.Parent = localPlayer.Character.Head
head_attachment.Name = "astolfo_attachment"
head_attachment.Position = Vector3.new(3.631, -2, 0.239)

local align_position = Instance.new("AlignPosition")
align_position.Attachment0 = astolfo_attachment
align_position.Attachment1 = head_attachment
align_position.Parent = astolfo

local align_orientation = Instance.new("AlignOrientation")
align_orientation.Attachment0 = astolfo_attachment
align_orientation.Attachment1 = head_attachment
align_orientation.Parent = astolfo

local dialog = Instance.new("Dialog")
dialog.Parent = astolfo
dialog.InitialPrompt = "Yahoo! What's your command, master?"
dialog.GoodbyeDialog = "Thanks!"
dialog.Tone = Enum.DialogTone.Friendly

local dialog_choice_noclip = Instance.new("DialogChoice")
dialog_choice_noclip.Name = "noclip_choice"
dialog_choice_noclip.UserDialog = "E to noclip"
dialog_choice_noclip.ResponseDialog = "You can now press E to noclip!"
dialog_choice_noclip.Parent = dialog

local dialog_choice_btools = Instance.new("DialogChoice")
dialog_choice_btools.Name = "btools_choice"
dialog_choice_btools.UserDialog = "Btools"
dialog_choice_btools.ResponseDialog = "Here are your tools, master!"
dialog_choice_btools.Parent = dialog

local dialog_choice_speed = Instance.new("DialogChoice")
dialog_choice_speed.Name = "speed_choice"
dialog_choice_speed.UserDialog = "Toggle speed"
dialog_choice_speed.ResponseDialog = "There you go master ❤️"
dialog_choice_speed.Parent = dialog

local astolfo_sounds = {"rbxassetid://4942209956", "rbxassetid://2901058656", "rbxassetid://7109386510"}


local astolfo_voice = Instance.new("Sound")
astolfo_voice.Parent = astolfo
astolfo_voice.Volume = 5

dialog.DialogChoiceSelected:Connect(function(player, choice)
	local random_choice = math.random(1, #astolfo_sounds)
	
	astolfo_voice.SoundId = astolfo_sounds[random_choice]
	astolfo_voice:Play()
	
	if choice.Name == "noclip_choice" then
		head_attachment.Position = Vector3.new(2.631, -1.75, -2.761)
		head_attachment.Orientation = Vector3.new(0, 135, 0)
		wait(4)
		head_attachment.Position = Vector3.new(3.631, -2, 0.239)
		head_attachment.Orientation = Vector3.new(0, 0, 0)
		local noclip = false
		game:GetService('RunService').Stepped:connect(function()
			if noclip then
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			end
		end)
		local plr = game.Players.LocalPlayer
		local mouse = plr:GetMouse()
		mouse.KeyDown:connect(function(key)

			if key == "e" then
				noclip = not noclip
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			end
		end)
	end
	
	if choice.Name == "btools_choice" then
		head_attachment.Position = Vector3.new(2.631, -1.75, -2.761)
		head_attachment.Orientation = Vector3.new(0, 135, 0)
		wait(4)
		head_attachment.Position = Vector3.new(3.631, -2, 0.239)
		head_attachment.Orientation = Vector3.new(0, 0, 0)
		Instance.new("HopperBin", game.Players.LocalPlayer.Backpack).BinType = 2
		Instance.new("HopperBin", game.Players.LocalPlayer.Backpack).BinType = 3
		Instance.new("HopperBin", game.Players.LocalPlayer.Backpack).BinType = 4
	end
	
	if choice.Name == "speed_choice" then
		head_attachment.Position = Vector3.new(2.631, -1.75, -2.761)
		head_attachment.Orientation = Vector3.new(0, 135, 0)
		wait(4)
		head_attachment.Position = Vector3.new(3.631, -2, 0.239)
		head_attachment.Orientation = Vector3.new(0, 0, 0)
		local current_speed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
		if current_speed == 100 then
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
		else
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
		end
	end
end)
