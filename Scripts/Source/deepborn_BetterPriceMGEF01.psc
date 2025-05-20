Scriptname deepborn_BetterPriceMGEF01 extends ActiveMagicEffect  
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
Actor Property PlayerRef auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
    if(akTarget == PlayerRef)
        ; Increase each ore value by 10%
        JobsOreCorundumValue.SetValue(JobsOreCorundumValue.GetValue() * 1.10)
        JobsOreEbonyValue.SetValue(JobsOreEbonyValue.GetValue() * 1.10)
        JobsOreGoldValue.SetValue(JobsOreGoldValue.GetValue() * 1.10)
        JobsOreIronValue.SetValue(JobsOreIronValue.GetValue() * 1.10)
        JobsOreMalachiteValue.SetValue(JobsOreMalachiteValue.GetValue() * 1.10)
        JobsOreMoonstoneValue.SetValue(JobsOreMoonstoneValue.GetValue() * 1.10)
        JobsOreOrichalcumValue.SetValue(JobsOreOrichalcumValue.GetValue() * 1.10)
        JobsOreQuicksilverValue.SetValue(JobsOreQuicksilverValue.GetValue() * 1.10)
        JobsOreSilverValue.SetValue(JobsOreSilverValue.GetValue() * 1.10)
    endif

EndEvent