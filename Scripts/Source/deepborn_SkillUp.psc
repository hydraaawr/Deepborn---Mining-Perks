Scriptname deepborn_SkillUp extends ObjectReference  
; Author: Hydraaawr https://github.com/hydraaawr; https://www.nexusmods.com/users/83984133

Actor Property PlayerRef auto
GlobalVariable Property _deepborn_SkillAdvanceMult auto
formlist property mineOreToolsList auto
float property SkillAdvanceMagnitude auto

Event OnActivate(ObjectReference akActionRef)
    if(akActionRef ==  PlayerRef)
        Debug.Notification("Activated ore")
        if PlayerRef.GetItemCount(mineOreToolsList) > 0 && self.GetCurrentDestructionStage() != 1 ; if has tools
            SkillAdvanceMagnitude = ((10+(10 * CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()
            Utility.Wait(1)
            CustomSkills.AdvanceSkill("mining", SkillAdvanceMagnitude)
            endif
    endif
EndEvent



Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	if akAggressor == PlayerRef	
        Debug.Notification("Damagestage: " + self.GetCurrentDestructionStage())
		if mineOreToolsList.hasForm(akSource) && self.GetCurrentDestructionStage() != 1  ;if has tools and no depleted ore
            SkillAdvanceMagnitude = ((10+(CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue() ; less advance because hitting is faster
            Utility.Wait(1)
            CustomSkills.AdvanceSkill("mining", SkillAdvanceMagnitude)
        endif
    endif

EndEvent