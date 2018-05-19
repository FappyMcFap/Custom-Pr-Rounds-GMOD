/*Replace melee weapon classes with your own where needed
  Requires Spec Dm and TTT ULX commands
  
  https://steamcommunity.com/sharedfiles/filedetails/?id=404599106
  https://steamcommunity.com/sharedfiles/filedetails/?id=127865722
*/

PowerRounds.AddRound({
		Name = "Melee Only (RDM Round)",
		Gamemode = "TTT",
		NameClr = Color(191, 12, 12),
		Description = "Melee Only, drop weapon to get a new one. Normal TTT Rules Apply",
		DescriptionClr = Color(191, 12, 12),
		BlockKarma = true,
		BlockScore = true,
		CustomRoundEnd = true,
		PlayersStart = function(Ply)
			melee_weapon = {
				"weapon_ttt_knife",
				"genji_melee",
				"weapon_ttt_homebat"
			}
				Ply:AddColorChat(Color(0, 255, 0),"RDM round kill everyone!")
				Ply:SetRole(ROLE_INNOCENT)
				Ply:StripWeapons()
				//print(melee_weapon[math.random(1, #melee_weapon)])
				table.sort(melee_weapon)
				Ply:Give(melee_weapon[math.random(1, #melee_weapon)])
		end,
		PlayerCanPickupWeapon = function(Ply, Ent)
			local limit = 1 
			if table.HasValue(melee_weapon, Ent:GetClass() )  and #Ply:GetWeapons() < limit then
				return true
			else
				return false
			end
		end,
		STIMER_1_GIVEMEMELEE = function()
			for k,v in pairs(PowerRounds.Players(2) ) do
				if !v:HasWeapon("weapon_ttt_knife") and !v:HasWeapon("genji_melee") and !v:HasWeapon("weapon_ttt_homebat") then
					// looks ugly sorry, only way I was able to do it
					v:Give(melee_weapon[math.random(1, #melee_weapon)])
				end
			end

			for _, W in pairs(ents.GetAll()) do
				if W:IsWeapon() && (W:GetOwner() == NULL || !W:GetOwner():IsValid()) then
				W:Remove()
				end
			end

		end,
		PlayerUpdate = function(Ply)
			local Plys = PowerRounds.Players(2, Ply)
			if #Plys < 2 then
				PowerRounds.EndRound(PR_WIN_GOOD)
				if #Plys == 1 then
					PowerRounds.Chat("All", Color(0, 255, 0), "Winner of this round was: " .. Plys[1]:Nick() )
				end
			end
		end,
		CTIMER_5_HEART = function()
			if not IsValid(LocalPlayer()) or not LocalPlayer():IsActiveRole(ROLE_INNOCENT) then return end
				for k, v in ipairs(player.GetAll()) do
					if v != LocalPlayer() and v:IsActiveRole(ROLE_INNOCENT) and v:Alive() then
					emitter = ParticleEmitter(LocalPlayer():GetPos())
					local heartbeat = emitter:Add("sprites/light_glow02_add_noz", v:GetPos() + Vector(0,0,50))
					heartbeat:SetDieTime(0.5)
					heartbeat:SetStartAlpha(255)
					heartbeat:SetEndAlpha(0)
					heartbeat:SetStartSize(50)
					heartbeat:SetEndSize(0)
					heartbeat:SetColor(255,0,0)
				end
			end
		end,
		STIMER_1_IDENTIFYCORPSE = function()
			for k,ply in pairs(player.GetAll() ) do
				local corpse = corpse_find(ply)
				corpse_identify(corpse)
			end
		end
	})
