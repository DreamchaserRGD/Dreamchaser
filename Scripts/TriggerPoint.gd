extends Node

signal triggerPoint

func enterTrigger(area):
	if area.get_name() == "Player":
		emit_signal("triggerPoint")
		queue_free()
