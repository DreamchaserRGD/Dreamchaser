extends Node

signal triggerPoint

func enterTrigger(area):
	if area.get_name() == "Player":
		if !G.lever_pulled:
			emit_signal("triggerPoint")
			queue_free()
