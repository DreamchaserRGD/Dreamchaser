extends Area2D

var root

func enterTrigger(body):
	if body.get_name() == "Player":
		print("Starte Level Tutorial Dream")
		root = get_tree().get_root().get_node("Tutorial")
		root.transition_to_Dream()
