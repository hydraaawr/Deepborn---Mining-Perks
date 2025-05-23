Scriptname deepborn_QuestScript extends Quest
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

; Properties to hold ore base values for better prices perk
Float Property BaseCorundumValue Auto
Float Property BaseEbonyValue Auto
Float Property BaseGoldValue Auto
Float Property BaseIronValue Auto
Float Property BaseMalachiteValue Auto
Float Property BaseMoonstoneValue Auto
Float Property BaseOrichalcumValue Auto
Float Property BaseQuicksilverValue Auto
Float Property BaseSilverValue Auto


Event OnInit()
    
    BaseCorundumValue = JobsOreCorundumValue.GetValue()
    BaseEbonyValue = JobsOreEbonyValue.GetValue()
    BaseGoldValue = JobsOreGoldValue.GetValue()
    BaseIronValue = JobsOreIronValue.GetValue()
    BaseMalachiteValue = JobsOreMalachiteValue.GetValue()
    BaseMoonstoneValue = JobsOreMoonstoneValue.GetValue()
    BaseOrichalcumValue = JobsOreOrichalcumValue.GetValue()
    BaseQuicksilverValue = JobsOreQuicksilverValue.GetValue()
    BaseSilverValue = JobsOreSilverValue.GetValue()
    
EndEvent