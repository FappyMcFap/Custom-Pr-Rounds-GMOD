Name = "One In The Chamber",
		Gamemode = "TTT",
		NameClr = Color(0, 0, 0),
		Description = "You have 1 life. Kill your enemies to get more bullets! Use them wisely. Winner gets 1k points! Fall Dmg is disabled",
		DescriptionClr = Color(191, 12, 12),
		BlockKarma = true,
		BlockScore = true,
		BlockTTTDamagelogs = true,
		CustomRoundEnd = true,
		ServerStart = function()
			hook.Add("EntityTakeDamage", "NoFallDmg", function(ent, dmginfo)
				if IsValid(ent) and ent:IsPlayer() and dmginfo:IsFallDamage() then
					return true
				end
			end)
		end,
		ServerEnd = function()
			hook.Remove("EntityTakeDamage", "NoFallDmg")
		end,
		PlayersStart = function(Ply)
			sound.Play("oitc/oitc.mp3", Ply:GetPos(), 90, 100)
			Ply:AddColorChat(Color(0, 255, 0),"Kill anyone you see!")
			allowed_weapons_oitc = {
				"weapon_ttt_knife",
				"oitc_p228"
			}
			Ply:StripWeapons()
			Ply:SetRole(ROLE_INNOCENT)
			Ply:SetHealth(1)
			Ply:SetMaxHealth(1)
			Ply:StripAmmo()
			Ply:Give("oitc_p228")
		end,
		STIMER_1_GiveKnife = function()
			for _, j in ipairs(PowerRounds.Players(2) ) do
				if !j:HasWeapon("weapon_ttt_knife") then
					j:Give("weapon_ttt_knife")
				end
			end
		end,
		PlayerCanPickupWeapon = function(Ply, Ent)
			local allowed_specdm_weapon_oitc = {
				"weapon_ghost_ak47",
				"weapon_ghost_augbar",
				"weapon_ghost_awp",
				"weapon_ghost_base",
				"weapon_ghost_crowbar",
				"weapon_ghost_galil",
				"weapon_ghost_glock",
				"weapon_ghost_hl2smg",
				"weapon_ghost_mac10",
				"weapon_ghost_magnum",
				"weapon_ghost_mp5",
				"weapon_ghost_pistol",
				"weapon_ghost_revolver",
				"weapon_ghost_rifle",
				"weapon_ghost_shotgun",
				"weapon_ghost_sledge"
			}

			if table.HasValue(allowed_weapons_oitc, Ent:GetClass() )  then
				return true
			elseif Ply:IsGhost() and table.HasValue(allowed_specdm_weapon_oitc, Ent:GetClass() ) then 
				return true
			else 
				return false
			end
		end,
		DoPlayerDeath = function(Ply, Attacker)
			if Attacker then
				Attacker:GiveAmmo(1,"Pistol")
			end

			if Ply then
				Ply:StripWeapons()
			end
		end,
		PlayerUpdate = function(Ply)
			local Plys = PowerRounds.Players(2, Ply)
			if #Plys < 2 then
				PowerRounds.EndRound(PR_WIN_GOOD)
				if #Plys == 1 then
					PowerRounds.Chat("All", Color(0, 255, 0), "Winner of this round was: " .. Plys[1]:Nick() )
					Plys[1]:PS2_AddStandardPoints( 1000 )
					Plys[1]:PrintMessage(3,"You've been given 1000 Points for winning the round!")
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