PowerRounds.AddRound({
		Name = "Swapping Traitor",
		Gamemode = "TTT",
		NameClr = Color(255, 255, 255),
		Description = "Every 45 seconds the Traitor changes! Detectives are disabled. You may be selected more than once in a row!",
		DescriptionClr = Color(191, 12, 12),
		ServerStart = function()
			game.ConsoleCommand("ttt_traitor_max 1\n")
			already_been_traitor = {}
			for k,v in pairs(player.GetAll() ) do
				if v:GetRole() == ROLE_TRAITOR then
					v:SetRole(ROLE_INNOCENT)
					v:SetCredits(0)
				elseif v:GetRole() == ROLE_DETECTIVE then
					v:StripWeapon("weapon_ttt_wtester")
					v:SetRole(ROLE_INNOCENT)
					v:SetCredits(0)
				end
			end
			local randomply = table.Random(player.GetAll())
			randomply:SetRole(ROLE_TRAITOR)
			randomply:AddCredits(1)
			SendFullStateUpdate()

		end,
		ServerEnd = function()
			game.ConsoleCommand("ttt_traitor_max 32\n")
		end,
		STIMER_1_CHECKALIVE = function()
			alive_players_cycle_traitor_round = {}
			for _,Ply in pairs(player.GetAll() ) do
				if Ply:Alive() and !Ply:IsSpec() then
					table.insert(alive_players_cycle_traitor_round,Ply)
				elseif !Ply:Alive() then
					table.RemoveByValue(alive_players_cycle_traitor_round,_)
				end
			end
		end,
		STIMER_45_CHANGETRAITORS = function()
			local randomply = table.Random(alive_players_cycle_traitor_round)
			for _,Ply in pairs(player.GetAll() ) do
				if Ply:GetRole() == ROLE_TRAITOR and Ply != randomply then
					RemoveBoughtWeapons(Ply)
					Ply:SetRole(ROLE_INNOCENT)
					Ply:ResetEquipment()
					Ply:SetCredits(0)
					SendFullStateUpdate()
				elseif Ply == randomply then
					randomply:SetRole(ROLE_TRAITOR)
					randomply:AddCredits(1)
					SendFullStateUpdate()			
				end
			end
		end
		
	})
