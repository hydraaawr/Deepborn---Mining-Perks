;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname PRKF__deepborn_OpenTree_Perk_0600002F Extends Perk Hidden

; 4.0.0 - Require nirn shard to resonate
Actor Property PlayerRef Auto
MiscObject Property _deepborn_NirnShard Auto

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
if(PlayerRef.GetItemCount(_deepborn_NirnShard) > 0)
    CustomSkills.OpenCustomSkillMenu("mining")
else
    Debug.Notification("You need a Nirn Shard in order to resonate with the vein.")
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
