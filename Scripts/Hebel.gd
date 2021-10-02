extends Area2D

var inArea = false;
signal leverPulled

func _process(delta):
	if Input.is_action_just_pressed("interact") and inArea:
		$AnimationPlayer.play("Schalter_Anim")

func enterTrigger(area):
	if area.get_name() == "Player":
		inArea = true;

func leaveTrigger(area):
	if area.get_name() == "Player":
		inArea = false;

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Schalter_Anim":
		emit_signal("leverPulled")
