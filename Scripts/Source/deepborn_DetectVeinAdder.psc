Scriptname deepborn_DetectVeinAdder extends activemagiceffect  
; Author: Hydraaawr https://github.com/hydraaawr; https://www.nexusmods.com/users/83984133

Actor Property PlayerRef auto
Spell Property _deepborn_DetectVeinSpell01 auto
Event OnEffectStart(Actor akTarget, Actor akCaster)
    if(akCaster == PlayerRef)
        PlayerRef.AddSpell(_deepborn_DetectVeinSpell01)
    endif
endEvent