Scriptname deepborn_IncreaseGemsChanceMGEF extends activemagiceffect  
; Author: Hydraaawr https://github.com/hydraaawr; https://www.nexusmods.com/users/83984133

GlobalVariable Property _deepborn_LItemGems10ChanceNone auto
Perk Property _deepborn_IncreaseGemsChance_Perk01 auto
Actor Property PlayerRef auto
deepborn_QuestScript Property QuestScript auto


Function AdjustGemsChance(Float factor)
    ; Applies the given factor to all ore base values globals
    _deepborn_LItemGems10ChanceNone.SetValue(QuestScript.BaseLItemGems10ChanceNone * factor)

EndFunction



Event OnEffectStart(Actor akTarget, Actor akCaster)
    if akTarget == PlayerRef
        Float multiplier = 1.0

        ; Determine the proper multiplier based on perks
        if PlayerRef.HasPerk(_deepborn_IncreaseGemsChance_Perk01) ;&& !PlayerRef.HasPerk(_deepborn_BetterPrice_Perk02) && !PlayerRef.HasPerk(_deepborn_BetterPrice_Perk03)
            multiplier = 0 ; Rank 1: 
        ; elseif PlayerRef.HasPerk(_deepborn_BetterPrice_Perk02) && !PlayerRef.HasPerk(_deepborn_BetterPrice_Perk03)
        ;     multiplier = 1.15 ; Rank 2: 
        ; elseif PlayerRef.HasPerk(_deepborn_BetterPrice_Perk03)
        ;     multiplier = 1.20 ; Rank 3: 
        endif

        AdjustGemsChance(multiplier)

    endif
EndEvent