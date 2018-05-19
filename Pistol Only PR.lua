/*
Replace all weapon classes with what you have on your server
Spec DM + ttt ulx commands required

https://steamcommunity.com/sharedfiles/filedetails/?id=127865722
https://steamcommunity.com/sharedfiles/filedetails/?id=404599106

*/

PowerRounds.AddRound({
		Name = "Pistols Only",
		Gamemode = "TTT",
		NameClr = Color(191, 12, 12),
		Description = "Pistols Only, drop weapon to get a new one. Pistols come with max ammo. Normal TTT Rules Apply.",
		DescriptionClr = Color(191, 12, 12),
		BlockTShop = true,											
		BlockDShop = true,	
		PlayersStart = function(Ply)

			 pistol_weapon = {
				"weapon_zm_revolver",
				"weapon_ttt_glock",
				"weapon_ttt_p228o",
				"weapon_ttt_p228n"
				"weapon_zm_pistol",
				"weapon_ttt_a3000",
				"weapon_ttt_pistol",
				"weapon_ttt_tflippy_tec9",
				"weapon_ttt_elites",
				"weapon_ttt_tflippy_rbull",
				"weapon_ttt_tflippy_luger",
				"weapon_ttt_hkusp",
				"weapon_ttt_m1911",
				"weapon_ttt_mr96",
				"weapon_ttt_revolver",
				"weapon_ttt_rp_pocket"
			}
				Ply:AddColorChat(Color(191, 12, 12),"Normal TTT Rules APPLY! No Rdming")
				Ply:StripWeapons()
				//print(Ply:Give(table.Random(pistol_weapon)))
				table.sort(pistol_weapon)
				Ply:Give(pistol_weapon[math.random(1, #pistol_weapon)])
				Ply:Give("weapon_zm_carry")
				Ply:Give("weapon_zm_improvised")
				Ply:Give("weapon_ttt_unarmed")
				if Ply:GetRole() == ROLE_DETECTIVE then
					Ply:Give("weapon_ttt_wtester")
				end
		end,
		PlayerCanPickupWeapon = function(Ply, Ent)
			if Ply:GetRole() == ROLE_INNOCENT or Ply:GetRole() == ROLE_TRAITOR then
				if table.HasValue(pistol_weapon, Ent:GetClass() )  and #Ply:GetWeapons() < 4 then
					return true
				end
			end
			if Ply:GetRole() == ROLE_DETECTIVE then
				if table.HasValue(pistol_weapon, Ent:GetClass() )  and #Ply:GetWeapons() < 5 then
					return true
				end
			end
		end,
		STIMER_1_GIVEPISTOL = function()
			for k,v in ipairs(PowerRounds.Players(2) ) do
				if !v:HasWeapon("weapon_zm_revolver") and !v:HasWeapon("weapon_ttt_glock") and !v:HasWeapon("weapon_ttt_p228o")
					and !v:HasWeapon("weapon_zm_pistol") and !v:HasWeapon("weapon_ttt_a3000") and !v:HasWeapon("weapon_ttt_tflippy_rbull")
					and !v:HasWeapon("weapon_ttt_pistol") and !v:HasWeapon("weapon_ttt_tflippy_tec9") and !v:HasWeapon("weapon_ttt_elites") 
					and !v:HasWeapon("weapon_ttt_tflippy_luger") and !v:HasWeapon("weapon_ttt_p228n") and !v:HasWeapon("weapon_ttt_hkusp")
					and !v:HasWeapon("weapon_ttt_m1911") and !v:HasWeapon("weapon_ttt_mr96") and !v:HasWeapon("weapon_ttt_revolver")
					and !v:HasWeapon("weapon_ttt_rp_pocket") then
					// sorry looks like crap. lol
						//print(v:Give(table.Random(pistol_weapon)))
						//v:Give(table.Random(pistol_weapon))
						v:Give(pistol_weapon[math.random(1, #pistol_weapon)])
						//print(v:Give(pistol_weapon[math.random(1, #pistol_weapon)]))
						
				end

				for q,p in pairs(v:GetWeapons() ) do
					kind = p.Kind
					ammo = string.lower(p.Primary.Ammo)

					white = {
					"pistol",
					"smg1",
					"alyxgun",
					"357",
					"buckshot"
					}

					if kind == WEAPON_PISTOL and table.HasValue(white, ammo) then
						v:SetAmmo(p.Primary.ClipMax, ammo)
					end
				end

				if #v:GetWeapons() >= 5 and v:GetRole() == ROLE_INNOCENT then
					v:StripWeapons()
					v:Give("weapon_zm_carry")
					v:Give("weapon_zm_improvised")
					v:Give("weapon_ttt_unarmed")
				end

				if #v:GetWeapons() >= 5 and v:GetRole() == ROLE_TRAITOR then
					v:StripWeapons()
					v:Give("weapon_zm_carry")
					v:Give("weapon_zm_improvised")
					v:Give("weapon_ttt_unarmed")
				end

				if #v:GetWeapons() >= 6 and v:GetRole() == ROLE_DETECTIVE then
					v:StripWeapons()
					v:Give("weapon_zm_carry")
					v:Give("weapon_zm_improvised")
					v:Give("weapon_ttt_unarmed")
					v:Give("weapon_ttt_wtester")
				end
			end


			for _, W in pairs(ents.GetAll()) do
				if W:IsWeapon() && (W:GetOwner() == NULL || !W:GetOwner():IsValid()) then
				W:Remove()
				end
			end
			
		end,
	})
