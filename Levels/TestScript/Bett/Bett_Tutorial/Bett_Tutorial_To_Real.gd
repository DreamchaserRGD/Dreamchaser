extends Area2D

var root

func enterTrigger(body):
	if body.get_name() == "Player":
		print("Starte Level Tutorial Real 1 oder 2")
		root = get_tree().get_root().get_node("SceneManager")
		root.transition_to_Real()
