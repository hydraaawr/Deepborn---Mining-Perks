Scriptname deepborn_QuestScript extends Quest
; Author: Hydraaawr https://github.com/hydraaawr; https://www.nexusmods.com/users/83984133

;; Better Prices Perk
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
Float Property BaseHeartStoneValue Auto
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; IncreaseGemsChance perk

GlobalVariable Property _deepborn_LItemGems10ChanceNone auto


Float Property BaseLItemGems10ChanceNone Auto

;; DAK perk
Actor Property PlayerRef Auto
Perk Property _deepborn_OpenTree_Perk01 Auto

;; Updating system var
float Property _deepborn_Version Auto
Spell Property _deepborn_IncreaseGemsChanceAb01 Auto
Spell Property _deepborn_IncreaseGemsChanceAb02 Auto
Spell Property _deepborn_IncreaseGemsChanceAb03 Auto



Function SetBaseValues() ; Technical debt: i'll have to make an update system for ore values too if I ever change them in future updates: 

    BaseCorundumValue = JobsOreCorundumValue.GetValue()
    BaseEbonyValue = JobsOreEbonyValue.GetValue()
    BaseGoldValue = JobsOreGoldValue.GetValue()
    BaseIronValue = JobsOreIronValue.GetValue()
    BaseMalachiteValue = JobsOreMalachiteValue.GetValue()
    BaseMoonstoneValue = JobsOreMoonstoneValue.GetValue()
    BaseOrichalcumValue = JobsOreOrichalcumValue.GetValue()
    BaseQuicksilverValue = JobsOreQuicksilverValue.GetValue()
    BaseSilverValue = JobsOreSilverValue.GetValue()
    BaseHeartStoneValue = _deepborn_JobsHeartStoneValue.GetValue()

    BaseLItemGems10ChanceNone = _deepborn_LItemGems10ChanceNone.GetValue()

EndFunction


;; 3.2.0 - Reapply increasegemchance changes when updating mod
Function UpdateManager()
    ;Debug.Notification("Deepborn Version: " + _deepborn_Version) ;DEBUG
    If (_deepborn_Version < 3.20)
        ;Debug.Notification("Deepborn Update: Reapplying Increase Gems MGEFs") ;DEBUG

        _deepborn_LItemGems10ChanceNone.SetValue(BaseLItemGems10ChanceNone) ; take the previous version base value

        ;; Dispel and readd in order to EffectStart() to trigger
        If(PlayerRef.HasSpell(_deepborn_IncreaseGemsChanceAb03))
            PlayerRef.DispelSpell(_deepborn_IncreaseGemsChanceAb03)
            PlayerRef.AddSpell(_deepborn_IncreaseGemsChanceAb03, false)
        elseif(PlayerRef.HasSpell(_deepborn_IncreaseGemsChanceAb02))
            PlayerRef.DispelSpell(_deepborn_IncreaseGemsChanceAb02)
            PlayerRef.AddSpell(_deepborn_IncreaseGemsChanceAb02, false)
        elseif(PlayerRef.HasSpell(_deepborn_IncreaseGemsChanceAb01))
            PlayerRef.DispelSpell(_deepborn_IncreaseGemsChanceAb01)
            PlayerRef.AddSpell(_deepborn_IncreaseGemsChanceAb01, false)
        endif
        _deepborn_Version = 3.20
    endif


endFunction


Event OnInit()
    
    Debug.Notification("Deepborn Initialized")
    SetBaseValues()
    UpdateManager() ; to set the version
    

    ;; Add perk
    PlayerRef.Addperk(_deepborn_OpenTree_Perk01)

    
EndEvent