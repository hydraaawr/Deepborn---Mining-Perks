Scriptname deepborn_BetterPriceMGEF extends ActiveMagicEffect  
; Author: Hydraaawr https://github.com/hydraaawr; https://www.nexusmods.com/users/83984133

GlobalVariable Property JobsOreCorundumValue Auto
GlobalVariable Property JobsOreEbonyValue Auto
GlobalVariable Property JobsOreGoldValue Auto
GlobalVariable Property JobsOreIronValue Auto
GlobalVariable Property JobsOreMalachiteValue Auto
GlobalVariable Property JobsOreMoonstoneValue Auto
GlobalVariable Property JobsOreOrichalcumValue Auto
GlobalVariable Property JobsOreQuicksilverValue Auto
GlobalVariable Property JobsOreSilverValue Auto
GlobalVariable Property _deepborn_JobsHeartStoneValue auto
Perk Property _deepborn_BetterPrice_Perk01 auto
Perk Property _deepborn_BetterPrice_Perk02 auto
Perk Property _deepborn_BetterPrice_Perk03 auto
Actor Property PlayerRef auto
deepborn_QuestScript Property QuestScript auto


Function AdjustOreValues(Float factor)
    ; Applies the given factor to all ore base values globals
    JobsOreCorundumValue.SetValue(QuestScript.BaseCorundumValue * factor)
    JobsOreEbonyValue.SetValue(QuestScript.BaseEbonyValue * factor)
    JobsOreGoldValue.SetValue(QuestScript.BaseGoldValue * factor)
    JobsOreIronValue.SetValue(QuestScript.BaseIronValue * factor)
    JobsOreMalachiteValue.SetValue(QuestScript.BaseMalachiteValue * factor)
    JobsOreMoonstoneValue.SetValue(QuestScript.BaseMoonstoneValue * factor)
    JobsOreOrichalcumValue.SetValue(QuestScript.BaseOrichalcumValue * factor)
    JobsOreQuicksilverValue.SetValue(QuestScript.BaseQuicksilverValue * factor)
    JobsOreSilverValue.SetValue(QuestScript.BaseSilverValue * factor)
    _deepborn_JobsHeartStoneValue.SetValue(QuestScript.BaseHeartStoneValue * factor)
EndFunction



Event OnEffectStart(Actor akTarget, Actor akCaster)
    if akTarget == PlayerRef
        Float multiplier = 1.0

        ; Determine the proper multiplier based on perks
        if PlayerRef.HasPerk(_deepborn_BetterPrice_Perk03)
            multiplier = 1.20 ; Rank 3: +20%
        elseif PlayerRef.HasPerk(_deepborn_BetterPrice_Perk02) 
            multiplier = 1.15 ; Rank 2: +15%
        elseif PlayerRef.HasPerk(_deepborn_BetterPrice_Perk01)
            multiplier = 1.10 ; Rank 1: +10%
        endif


        AdjustOreValues(multiplier)

    endif
EndEvent

