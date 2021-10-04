extends Node2D

var inArea = false;
onready var area = $Area2D
export(int) var lever_number

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
		if lever_number == 1:
			G.lever_pulled_Gatter1 = true;
		elif lever_number == 2:
			G.lever_pulled_Gatter2 = true;
		elif lever_number == 3:
			G.lever_pulled_Gatter3 = true;
