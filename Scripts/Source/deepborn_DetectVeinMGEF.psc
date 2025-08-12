Scriptname deepborn_DetectVeinMGEF extends activemagiceffect  
; Author: Hydraaawr https://github.com/hydraaawr; https://www.nexusmods.com/users/83984133

Perk Property _deepborn_DetectVein_Perk01 auto
Formlist Property _deepborn_MiningFurnitureMarkerList auto
Actor Property PlayerRef auto
Sound Property _deepborn_DetectVeinSound auto
Form Property _deepborn_FXSmokeSmokeLg1x1_color auto
objectReference Smoke1
objectReference Smoke2

Event OnEffectStart(Actor akTarget, Actor akCaster)
    if(akCaster == PlayerRef)

        ObjectReference ClosestMiningFurn = Game.FindClosestReferenceOfAnyTypeInListFromRef(_deepborn_MiningFurnitureMarkerList,PlayerRef, 10000) ; uses mining furnitures for being a much lower count than activators

        MineOreFurnitureScript miningScript = ClosestMiningFurn as MineOreFurnitureScript ; dynamic assign, in order to pass evaluate its properties
        ;Debug.Notification()
        if(ClosestMiningFurn)
            
            Debug.Notification("FOUND available mining furniture at " + ClosestMiningFurn.GetDistance(PlayerRef))

            _deepborn_DetectVeinSound.Play(ClosestMiningFurn)
            ;; place 2 smokes for visibility
            Smoke1 = ClosestMiningFurn.PlaceAtMe(_deepborn_FXSmokeSmokeLg1x1_color)
            Smoke2 = ClosestMiningFurn.PlaceAtMe(_deepborn_FXSmokeSmokeLg1x1_color)

            Utility.Wait(5) ; how long they last

            Smoke1.Disable(True)
            Smoke2.Disable(True)

            Smoke1.Delete()
            Smoke2.Delete()



        Else

            Debug.Notification("No available mining furniture found")
            
        endif
    endif
endEvent