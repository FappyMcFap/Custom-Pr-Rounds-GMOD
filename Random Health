PowerRounds.AddRound({
		Name = "Random Health",
		Gamemode = "TTT",
		NameClr = Color(255, 255, 255),
		Description = "Inno's spawn with 1-150 HP & Traitors 50-150 (Randomized)",
		DescriptionClr = Color(191, 12, 12),
		PlayersStart = function(Ply)
			Ply:SetMaxHealth(150)

			if Ply:GetRole() == ROLE_TRAITOR then
				Ply:SetHealth(math.random(50,150))
			elseif (Ply:GetRole() == ROLE_DETECTIVE or Ply:GetRole() == ROLE_INNOCENT) then
				Ply:SetHealth(math.random(1,150))
			end
		end
	})
