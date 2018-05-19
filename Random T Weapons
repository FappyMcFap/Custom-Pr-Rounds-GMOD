/*
Replace all weapon classes with what you want to be added. Delete anything not needed

*/

PowerRounds.AddRound({
		Name = "Random T Weapons",
		Gamemode = "TTT",
		NameClr = Color(191, 12, 12),
		Description = "Every 30 Seconds you get a random T Weapon! Normal Rules Apply!!!",
		DescriptionClr = Color(191, 12, 12),
		PlayersStart = function(Ply)
			pr_round_random_traitor_weapons = {
				"weapon_ttt_knife",
				"weapon_ttt_tflippy_dreagle",
				"healsniper",
				"weapon_ttt_tflippy_si-g3sg1",
				"weapon_ttt_tmp",
				"weapon_ttt_tflippy_dartgun",
				"weapon_ttt_ak47",
				"weapon_ttt_awp",
				"weapon_ttt_tflippy_hkmp7",
				"weapon_ttt_m4a1_s"

			}
			Ply:Give(pr_round_random_traitor_weapons[math.random(1, #pr_round_random_traitor_weapons)])
		end,
		STIMER_30_RANDOMTWEP = function()
			for _,Ply in pairs(player.GetAll() ) do
				for q,p in pairs( pr_round_random_traitor_weapons ) do
					table.sort(pr_round_random_traitor_weapons)
					if Ply:HasWeapon(p) then
						Ply:StripWeapon(p)
						Ply:Give(pr_round_random_traitor_weapons[math.random(1, #pr_round_random_traitor_weapons)])
					elseif !Ply:HasWeapon("weapon_ttt_knife") and !Ply:HasWeapon("weapon_ttt_tflippy_dreagle") and 
						!Ply:HasWeapon("healsniper") and !Ply:HasWeapon("weapon_ttt_tflippy_si-g3sg1") and !Ply:HasWeapon("weapon_ttt_tmp") and 
						!Ply:HasWeapon("weapon_ttt_tflippy_dartgun") and !Ply:HasWeapon("weapon_ttt_ak47")
						and 
						!Ply:HasWeapon("weapon_ttt_awp") and !Ply:HasWeapon("weapon_ttt_tflippy_hkmp7") 
						and !Ply:HasWeapon("weapon_ttt_m4a1_s") then 
						Ply:Give(pr_round_random_traitor_weapons[math.random(1, #pr_round_random_traitor_weapons)])
					end
				end
			end
		end
	})
