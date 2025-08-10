Scriptname deepborn_DetectVeinMGEF extends activemagiceffect  
; Author: Hydraaawr https://github.com/hydraaawr; https://www.nexusmods.com/users/83984133

Perk Property _deepborn_DetectVein_Perk01 auto
Formlist Property _deepborn_MiningFurnitureMarkerList auto
Actor Property PlayerRef auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    if(akCaster == PlayerRef)

        Form ClosestMiningFurn = Game.FindClosestReferenceOfAnyTypeInListFromRef(_deepborn_MiningFurnitureMarkerList,PlayerRef, 10000) ; uses mining furnitures for being a much lower count than activators
        
        if(ClosestMiningFurn)
            
            Debug.Notification("FOUND mining furniture")

        Else

            Debug.Notification("No mining furniture found")
            
        endif
    endif
endEvent