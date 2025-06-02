Scriptname deepborn_Tracker extends ReferenceAlias  
; Author: Hydraaawr https://github.com/hydraaawr; https://www.nexusmods.com/users/83984133

Keyword Property LocTypeMine auto
Actor Property PlayerRef auto
Perk Property _deepborn_MineFortifyMovSpeed_Perk01 auto
Spell Property _deepborn_MineFortifyMovSpeedAb01 auto


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    if PlayerRef.HasPerk(_deepborn_MineFortifyMovSpeed_Perk01)
        if akNewLoc.HasKeyword(LocTypeMine)

            Debug.Notification("Entered a mine")
            PlayerRef.addSpell(_deepborn_MineFortifyMovSpeedAb01)

        elseif !akNewLoc.HasKeyword(LocTypeMine) && PlayerRef.HasSpell(_deepborn_MineFortifyMovSpeedAb01)

            PlayerRef.DispelSpell(_deepborn_MineFortifyMovSpeedAb01)
            
        endif
    endif
endEvent