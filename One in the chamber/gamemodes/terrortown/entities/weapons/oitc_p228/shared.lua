if SERVER then
   AddCSLuaFile( "shared.lua" )
   resource.AddFile("tflppy/vgui/ttt/icon_p228.vmt")
   resource.AddFile("tflppy/vgui/ttt/icon_p228.vtf")
end

if CLIENT then
   SWEP.PrintName = "P228 Compact"
   SWEP.Slot      = 1 -- add 1 to get the slot number key
   SWEP.Icon = "tflippy/vgui/ttt/icon_p228"
   
   SWEP.ViewModelFOV  = 60
   SWEP.ViewModelFlip = false
end

SWEP.Base				= "weapon_tttbase_tflippy"

SWEP.HoldType			= "pistol"
SWEP.AutoSpawnable      = false
SWEP.AllowDrop = false
SWEP.IsSilent = false
SWEP.NoSights = false
SWEP.Kind = WEAPON_PISTOL

SWEP.Primary.Delay       = 0.145
SWEP.Primary.Recoil      = 2.35
SWEP.Primary.Automatic   = false
SWEP.Primary.SoundLevel	= 95

SWEP.Primary.ClipSize    = 1
SWEP.Primary.ClipMax     = 5
SWEP.Primary.DefaultClip = 1
SWEP.Primary.Ammo        = "Pistol"
SWEP.AmmoEnt = ""
SWEP.HeadshotMultiplier = 1.35
--SWEP.CanBuy = {}

SWEP.Primary.Damage      = 27
SWEP.Primary.Cone        = 0.02
SWEP.Primary.NumShots 	 = 0

SWEP.IronSightsPos = Vector(-6.00, -0.00, 3.80)
SWEP.IronSightsAng = Vector(0.00, -0.01, 0.00)

SWEP.UseHands	= true
SWEP.ViewModel	= "models/weapons/cstrike/c_pist_p228.mdl"
SWEP.WorldModel	= "models/weapons/w_pist_p228.mdl"
SWEP.Primary.Sound = Sound("Weapon_P228.Single")