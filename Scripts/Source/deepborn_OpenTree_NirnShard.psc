Scriptname deepborn_OpenTree_NirnShard extends ObjectReference  

Event OnEquipped(Actor akActor)
    if akActor == Game.GetPlayer()
        CustomSkills.OpenCustomSkillMenu("mining")
    endif

EndEvent