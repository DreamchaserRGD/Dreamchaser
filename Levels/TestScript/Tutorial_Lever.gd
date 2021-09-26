extends Area2D

var root

func enterTrigger(body):
	if body.get_name() == "Player":
		print("Hebel betätigt!")
		root = get_tree().get_root().get_node("SceneManager")
		root.leverGetPulled()
