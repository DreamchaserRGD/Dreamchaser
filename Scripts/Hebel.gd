extends Node2D

var inArea = false;
onready var area = $Area2D
signal pulled_lever
export(int) var level_number
export(String) var bed_name
export(String) var dream_or_real = "real"

func _process(delta):
	if Input.is_action_just_pressed("interact") and inArea:
		get_child(2).play("Schalter_Anim")

func enterTrigger(area):
	if area.get_name() == "Player":
		inArea = true;

func leaveTrigger(area):
	if area.get_name() == "Player":
		inArea = false;


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Schalter_Anim":
		G.lever_pulled = true;
		G.next_level_bed = bed_name
		G.next_level_number = level_number
		G.real_or_dream = dream_or_real
		print("Signal senden")
		emit_signal("pulled_lever")
