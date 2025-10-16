Scriptname deepborn_IncreaseGemsChanceMGEF extends activemagiceffect  
; Author: Hydraaawr https://github.com/hydraaawr; https://www.nexusmods.com/users/83984133

GlobalVariable Property _deepborn_LItemGems10ChanceNone auto
Perk Property _deepborn_IncreaseGemsChance_Perk01 auto
Perk Property _deepborn_IncreaseGemsChance_Perk02 auto
Perk Property _deepborn_IncreaseGemsChance_Perk03 auto
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
        if PlayerRef.HasPerk(_deepborn_IncreaseGemsChance_Perk03)
            multiplier = 0.75 ; Rank 3: 25% more chance of obtaining gems
        elseif PlayerRef.HasPerk(_deepborn_IncreaseGemsChance_Perk02)
            multiplier = 0.80 ; Rank 2: 20% more chance of obtaining gems
        elseif PlayerRef.HasPerk(_deepborn_IncreaseGemsChance_Perk01)
            multiplier = 0.85 ; Rank 1: 15% more chance of obtaining gems (15% less chance none)
        endif


        AdjustGemsChance(multiplier)

    endif
EndEvent