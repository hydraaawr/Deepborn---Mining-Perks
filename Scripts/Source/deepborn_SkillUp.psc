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
Keyword Property _deepborn_Tier6Ore auto
Weapon Property DLC2AncientNordPickaxe auto
Weapon Property DLC2RR03NordPickaxe auto
Weapon Property DLC2dunKolbjornRalisPickaxe auto
;; deepborn 4.0.0: added Nirn Shard as a way of opening skill tree
MiscObject Property _deepborn_NirnShard auto
Bool property FirstTimeMining = true auto


Function AddNirnShardToPlayer()
    if(PlayerRef.GetItemCount(_deepborn_NirnShard) == 0) ;; only if player doesn't already have one
        PlayerRef.AddItem(_deepborn_NirnShard, 1, true)
        if FirstTimeMining
            FirstTimeMining = false
            Debug.Notification("You have obtained a Nirn Shard! You can use this to unlock the Deepborn Mining skill tree in the Skills menu. (This message will only appear once)")
        endif
    endif
EndFunction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnActivate(ObjectReference akActionRef)
    if(akActionRef ==  PlayerRef)
        ;Debug.Notification("Activated ore")
        if PlayerRef.GetItemCount(mineOreToolsList) > 0 && self.GetCurrentDestructionStage() != 1 && !PlayerRef.HasMagicEffect(_deepborn_SkillUpCDSpellEffect) ; if has tools, not depleted. For some reason it includes DLC2StalhrimMineOreToolsList too
            ;; init cd
            _deepborn_SkillUpCDSpell.Cast(PlayerRef,PlayerRef)
            
            AddNirnShardToPlayer()

            if(PlayerRef.GetItemCount(_deepborn_NirnShard) == 0) ;; only if player doesn't already have one
                PlayerRef.AddItem(_deepborn_NirnShard, 1, true)
                Debug.Notification("You have obtained a Nirn Shard! You can use this to unlock the Deepborn Mining skill tree in the Skills menu.")
                
            endif
        


            ;Evaluate which ore tier is to provide different exp
            if(self.HasKeyword(_deepborn_Tier1Ore))
                ;Debug.Notification("Tier 1 Ore")
                SkillAdvanceMagnitude = ((10+(10 * CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()
            
            elseif(self.HasKeyword(_deepborn_Tier2Ore))
                ;Debug.Notification("Tier 2 Ore")
                SkillAdvanceMagnitude = ((20+(11 * CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()

            elseif(self.HasKeyword(_deepborn_Tier3Ore))
                ;Debug.Notification("Tier 3 Ore")
                SkillAdvanceMagnitude = ((30+(12 * CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()

            elseif(self.HasKeyword(_deepborn_Tier4Ore))
                ;Debug.Notification("Tier 4 Ore")
                SkillAdvanceMagnitude = ((40+(13 * CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()

            elseif(self.HasKeyword(_deepborn_Tier5Ore))
                ;Debug.Notification("Tier 5 Ore")
                SkillAdvanceMagnitude = ((50+(14 * CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()

            elseif(self.HasKeyword(_deepborn_Tier6Ore) && ((PlayerRef.GetItemCount(DLC2AncientNordPickaxe) > 0) ||  PlayerRef.GetItemCount(DLC2RR03NordPickaxe) > 0 ||  PlayerRef.GetItemCount(DLC2dunKolbjornRalisPickaxe) > 0)) ; special condition for stalhrim. In future updates, maybe replace by DLC2StalhrimMineOreToolsList
                ;Debug.Notification("Tier 6 Ore")
                SkillAdvanceMagnitude = ((60+(15 * CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()

            endif

            Utility.Wait(1)
            CustomSkills.AdvanceSkill("mining", SkillAdvanceMagnitude)

        elseif(PlayerRef.HasMagicEffect(_deepborn_SkillUpCDSpellEffect))

            Debug.Notification("You are mining too quickly. No experience gained.")

        endif
    
    endif
EndEvent



Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked) ; less advancement because hitting is faster

	if akAggressor == PlayerRef	
        ;Debug.Notification("Damagestage: " + self.GetCurrentDestructionStage())
		if mineOreToolsList.hasForm(akSource) && self.GetCurrentDestructionStage() != 1  ;if has tools and no depleted ore
            
            AddNirnShardToPlayer()
            
            ;Evaluate which ore tier is to provide different exp
            if(self.HasKeyword(_deepborn_Tier1Ore))

                SkillAdvanceMagnitude = ((10+(CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue() 
            
            elseif(self.HasKeyword(_deepborn_Tier2Ore))

                SkillAdvanceMagnitude = ((20+(CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()

            elseif(self.HasKeyword(_deepborn_Tier3Ore))

                SkillAdvanceMagnitude = ((30+(CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()

            elseif(self.HasKeyword(_deepborn_Tier4Ore))

                SkillAdvanceMagnitude = ((40+(CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()

            elseif(self.HasKeyword(_deepborn_Tier5Ore))

                SkillAdvanceMagnitude = ((50+(CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()
            
            elseif(self.HasKeyword(_deepborn_Tier6Ore) && ((PlayerRef.IsEquipped(DLC2AncientNordPickaxe)) ||  (PlayerRef.IsEquipped(DLC2RR03NordPickaxe)) || (PlayerRef.IsEquipped(DLC2dunKolbjornRalisPickaxe)))) ; special condition for stalhrim

                SkillAdvanceMagnitude = ((60+(CustomSkills.GetSkillLevel("mining")))/2) * _deepborn_SkillAdvanceMult.GetValue()
            endif

            Utility.Wait(1)
            CustomSkills.AdvanceSkill("mining", SkillAdvanceMagnitude)
        endif
    endif

EndEvent