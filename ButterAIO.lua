--[[
V1.0 - Initial Commit]]--

if not pcall( require, "Inspired" ) then PrintChat("You are missing Inspired.lua - Go download it and save it in Common!") return end
AutoUpdate("/DarknessVoided/Bombified/blob/master/ButterAIO.lua","/DarknessVoided/Bombified/blob/master/ButterAIO.Version","ButterAIO.lua",1)

SupportedHero = {["Akali"] = true}
Class = "Akali"

function Akali:__init()
  OnTick(function(myHero) self:OnLoad(myHero) end)
  OnDraw(function(myHero) self:On_Draw(myHero) end)
  
    OnProcessSpellComplete(function(Object, spell)
      if Object == GetMyHero() and spell.name == AkaliR and Akali.Combo.W:Value() and Ready(_W) then
        CastTargetSpell(_W,GetOrigin(myHero))
      end
    end)

Akali = MenuConfig("[ButterAIO", "ButterAIO")

Akali:Menu("Combo", "Combo")
Akali:Menu("Drawings", "Drawings")
Akali:Menu("Misc", "Misc")

Akali.Combo:Boolean("Q", "Use Q", true)
Akali.Combo:Boolean("W", "Use W immediately after R", true)
Akali.Combo:Boolean("E", "Use E", true)
Akali.Combo:Boolean("R", "Use R", true)

Akali.Drawings:Boolean("Q", "Show Q range", false)
Akali.Drawings;Boolean("WSpots", "Draw W Spots which gives extra range(For Escaping)", false)
Akali.Drawings:Boolean("E", "Show E range", false)
Akali.Drawings:Boolean("R", "Show R range", false)
end --Ends Init function

function Akali:OnLoad()
  self:CallCombo()
end

function self:CallCombo()
  if IOW:MODE() == "Combo" then
    self:Combo()
  end
end

function Akali:Combo()
    local target = GetCurrentTarget()
    
      if Ready(_Q) and ValidTarget(target,600) and Akali.Combo.Q:value() then
        CastTargetSpell(_Q,target)
        AttackUnit(target)
      end
      
      if Ready(_E) and ValidTarget(target,300) and Akali.COmbo.Q:Value() then
        CastSpell(_E)
      end
      
      if Ready(_R) and ValidTarget(target) >= Akali.Combo.QW:Value() then
        CastTargetSpell(_R,target)
      end
end

function Akali:KS()
end
