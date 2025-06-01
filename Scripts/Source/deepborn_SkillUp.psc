Scriptname deepborn_SkillUp extends ObjectReference  
; Author: Hydraaawr https://github.com/hydraaawr; https://www.nexusmods.com/users/83984133

Actor Property PlayerRef auto
GlobalVariable Property _deepborn_SkillAdvanceMult auto
formlist property mineOreToolsList auto
Spell Property _deepborn_SkillUpCDSpell auto
MagicEffect Property _deepborn_SkillUpCDSpellEffect auto
float property SkillAdvanceMagnitude auto
Keyword Property _deepborn_Tier1Ore auto
Keyword Property _deepborn_Tier2Ore auto
Keyword Property _deepborn_Tier3Ore auto
Keyword Property _deepborn_Tier4Ore auto
Keyword Property _deepborn_Tier5Ore auto
Weapon Property DLC2AncientNordPickaxe auto


Event OnActivate(ObjectReference akActionRef)
    if(akActionRef ==  PlayerRef && !PlayerRef.HasMagicEffect(_deepborn_SkillUpCDSpellEffect))
        Debug.Notification("Activated ore")
        if PlayerRef.GetItemCount(mineOreToolsList) > 0 && self.GetCurrentDestructionStage() != 1 ; if has tools, not depleted
            ;; init cd
            _deepborn_SkillUpCDSpell.Cast(PlayerRef,PlayerRef)

            ;Evaluate which ore tier is to provide different exp
            if(self.HasKeyword(_deepborn_Tier1Ore))

                SkillAdvanceMagnitude = ((10+(10 * CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()
            
            elseif(self.HasKeyword(_deepborn_Tier2Ore))

                SkillAdvanceMagnitude = ((20+(10 * CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()

            elseif(self.HasKeyword(_deepborn_Tier3Ore))

                SkillAdvanceMagnitude = ((30+(10 * CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()

            elseif(self.HasKeyword(_deepborn_Tier4Ore))

                SkillAdvanceMagnitude = ((40+(10 * CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()

            elseif(self.HasKeyword(_deepborn_Tier5Ore) && PlayerRef.GetItemCount(DLC2AncientNordPickaxe) > 0) ; special condition for stalhrim

                SkillAdvanceMagnitude = ((50+(10 * CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()

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

            elseif(self.HasKeyword(_deepborn_Tier3Ore))

                SkillAdvanceMagnitude = ((30+(CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()

            elseif(self.HasKeyword(_deepborn_Tier4Ore))

                SkillAdvanceMagnitude = ((40+(CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()

            elseif(self.HasKeyword(_deepborn_Tier5Ore) && PlayerRef.IsEquipped(DLC2AncientNordPickaxe)) ; special condition for stalhrim

                SkillAdvanceMagnitude = ((50+(CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()
            endif

            Utility.Wait(1)
            CustomSkills.AdvanceSkill("mining", SkillAdvanceMagnitude)
        endif
    endif

EndEvent