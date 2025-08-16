Scriptname deepborn_DetectVeinMGEF extends activemagiceffect  
; Author: Hydraaawr https://github.com/hydraaawr; https://www.nexusmods.com/users/83984133

Formlist Property _deepborn_MiningFurnitureMarkerList auto
Actor Property PlayerRef auto
Sound Property _deepborn_DetectVeinSound auto
Form Property _deepborn_FXSmokeSmokeLg1x1_color auto
Perk Property _deepborn_DetectVein_Perk01 auto
Perk Property _deepborn_DetectVein_Perk02 auto
objectReference Smoke1
objectReference Smoke2

Event OnEffectStart(Actor akTarget, Actor akCaster)
    if(akCaster == PlayerRef)

        ObjectReference ClosestMiningFurn = Game.FindClosestReferenceOfAnyTypeInListFromRef(_deepborn_MiningFurnitureMarkerList,PlayerRef, 5000) ; uses mining furnitures for being a much lower count than activators

        MineOreFurnitureScript miningScript = ClosestMiningFurn as MineOreFurnitureScript ; dynamic assign, in order to pass evaluate its properties
        ;Debug.Notification()
        if(ClosestMiningFurn)
            
            ;Debug.Notification("FOUND available mining furniture at " + ClosestMiningFurn.GetDistance(PlayerRef))
            if PlayerRef.HasPerk(_deepborn_DetectVein_Perk02) ; Sound + visual
                _deepborn_DetectVeinSound.Play(ClosestMiningFurn)
                ;; place 2 smokes for visibility
                Smoke1 = ClosestMiningFurn.PlaceAtMe(_deepborn_FXSmokeSmokeLg1x1_color)
                Smoke2 = ClosestMiningFurn.PlaceAtMe(_deepborn_FXSmokeSmokeLg1x1_color)
                

            elseif PlayerRef.HasPerk(_deepborn_DetectVein_Perk01) ; only sound

                _deepborn_DetectVeinSound.Play(ClosestMiningFurn)
                
            endif

            Utility.Wait(5) ; how long they last

            ;; Remove them in order not to clutter the ambient too much
            if(Smoke1 && Smoke2) ; if they exist
                Smoke1.Disable(True)
                Smoke2.Disable(True)

                Smoke1.Delete()
                Smoke2.Delete()
            endif


        Else

            Debug.Notification("There are no ore veins nearby.")
            
        endif
    endif
endEvent