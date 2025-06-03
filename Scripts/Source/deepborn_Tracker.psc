Scriptname deepborn_Tracker extends ReferenceAlias  
; Author: Hydraaawr https://github.com/hydraaawr; https://www.nexusmods.com/users/83984133

Keyword Property LocTypeMine auto
Actor Property PlayerRef auto
Perk Property _deepborn_MineFortifyMovSpeed_Perk01 auto
Spell Property _deepborn_MineFortifyMovSpeedAb01 auto
Perk Property _deepborn_MineFortifyCarryWeight_Perk01 auto
Spell Property _deepborn_MineFortifyCarryWeightAb01 auto
MagicEffect Property _deepborn_MineFortifyCarryWeightAbEffect01 auto


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    if PlayerRef.HasPerk(_deepborn_MineFortifyMovSpeed_Perk01)
        if akNewLoc.HasKeyword(LocTypeMine)

            Debug.Notification("You feel faster")
            PlayerRef.addSpell(_deepborn_MineFortifyMovSpeedAb01, false)

        elseif !akNewLoc.HasKeyword(LocTypeMine) && PlayerRef.HasSpell(_deepborn_MineFortifyMovSpeedAb01)

            PlayerRef.DispelSpell(_deepborn_MineFortifyMovSpeedAb01)
            
        endif
    endif


    if PlayerRef.HasPerk(_deepborn_MineFortifyCarryWeight_Perk01) && !PlayerRef.HasMagicEffect(_deepborn_MineFortifyCarryWeightAbEffect01) ; Has perk and its not under effects of mgef
        if  akOldLoc.HasKeyword(LocTypeMine) && !akNewLoc.HasKeyword(LocTypeMine) ;;  leaving a mine
            Debug.Notification("You feel weightless")
            _deepborn_MineFortifyCarryWeightAb01.Cast(PlayerRef,PlayerRef)
        endif
    endif
endEvent