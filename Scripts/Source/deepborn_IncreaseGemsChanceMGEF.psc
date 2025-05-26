Scriptname deepborn_IncreaseGemsChanceMGEF extends activemagiceffect  
; Author: Hydraaawr https://github.com/hydraaawr; https://www.nexusmods.com/users/83984133

GlobalVariable Property _deepborn_LItemGems10ChanceNone auto
Perk Property _deepborn_IncreaseGemsChance_Perk01 auto
Perk Property _deepborn_IncreaseGemsChance_Perk02 auto
Actor Property PlayerRef auto
deepborn_QuestScript Property QuestScript auto


Function AdjustGemsChance(Float factor)
    ; Applies the given factor to all gems base chanceNONE globals
    _deepborn_LItemGems10ChanceNone.SetValue(QuestScript.BaseLItemGems10ChanceNone * factor)

EndFunction



Event OnEffectStart(Actor akTarget, Actor akCaster)
    if akTarget == PlayerRef
        Float multiplier = 1.0

        ; Determine the proper multiplier based on perks
        if PlayerRef.HasPerk(_deepborn_IncreaseGemsChance_Perk01) && !PlayerRef.HasPerk(_deepborn_IncreaseGemsChance_Perk02) ;&& !PlayerRef.HasPerk(_deepborn_BetterPrice_Perk03)
            multiplier = 0.90 ; Rank 1: 10% more chance of obtaining gems (10% less chance none)
        elseif PlayerRef.HasPerk(_deepborn_IncreaseGemsChance_Perk02) ;&& !PlayerRef.HasPerk(_deepborn_BetterPrice_Perk03)
            multiplier = 0.85 ; Rank 2: 15% more chance of obtaining gems
        ; elseif PlayerRef.HasPerk(_deepborn_BetterPrice_Perk03)
        ;     multiplier = 1.20 ; Rank 3: 
        endif

        AdjustGemsChance(multiplier)

    endif
EndEvent