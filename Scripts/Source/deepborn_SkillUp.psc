Scriptname deepborn_SkillUp extends ObjectReference  
; Author: Hydraaawr https://github.com/hydraaawr; https://www.nexusmods.com/users/83984133

Actor Property PlayerRef auto
GlobalVariable Property _deepborn_SkillAdvanceMult auto
formlist property mineOreToolsList auto

Event OnActivate(ObjectReference akActionRef)
    if(akActionRef ==  PlayerRef)
        Debug.Notification("Activated ore")
        if PlayerRef.GetItemCount(mineOreToolsList) > 0 ; if has tools
            float SkillAdvanceMagnitude = ((10+(10 * CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()
            Utility.Wait(1)
            CustomSkills.AdvanceSkill("mining", SkillAdvanceMagnitude)
            endif
    endif
EndEvent