extends CanvasLayer

signal transitioned

func transition():
	get_child(0).get_child(0).play("fade_to_black")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		emit_signal("transitioned")
		get_child(0).get_child(0).play("fade_to_normal")
