Scriptname deepborn_SkillUp extends ObjectReference  
; Author: Hydraaawr https://github.com/hydraaawr; https://www.nexusmods.com/users/83984133

Actor Property PlayerRef auto
GlobalVariable Property _deepborn_SkillAdvanceMult auto
formlist property mineOreToolsList auto
float property SkillAdvanceMagnitude auto
Keyword Property _deepborn_Tier1Ore auto
Keyword Property _deepborn_Tier2Ore auto

Event OnActivate(ObjectReference akActionRef)
    if(akActionRef ==  PlayerRef)
        Debug.Notification("Activated ore")
        if PlayerRef.GetItemCount(mineOreToolsList) > 0 && self.GetCurrentDestructionStage() != 1 ; if has tools
            ;Evaluate which ore tier is to provide different exp
            if(self.HasKeyword(_deepborn_Tier1Ore))

                SkillAdvanceMagnitude = ((10+(10 * CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()
            
            elseif(self.HasKeyword(_deepborn_Tier2Ore))

                SkillAdvanceMagnitude = ((20+(10 * CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()

            endif

            Utility.Wait(1)
            CustomSkills.AdvanceSkill("mining", SkillAdvanceMagnitude)
            endif
    endif
EndEvent



Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked) ; less advancement because hitting is faster

	if akAggressor == PlayerRef	
        Debug.Notification("Damagestage: " + self.GetCurrentDestructionStage())
		if mineOreToolsList.hasForm(akSource) && self.GetCurrentDestructionStage() != 1  ;if has tools and no depleted ore
            ;Evaluate which ore tier is to provide different exp
            if(self.HasKeyword(_deepborn_Tier1Ore))

                SkillAdvanceMagnitude = ((10+(CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue() 
            
            elseif(self.HasKeyword(_deepborn_Tier2Ore))

                SkillAdvanceMagnitude = ((20+(CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()


            endif

            Utility.Wait(1)
            CustomSkills.AdvanceSkill("mining", SkillAdvanceMagnitude)
        endif
    endif

EndEvent