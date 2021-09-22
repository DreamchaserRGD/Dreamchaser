extends Area2D


func enterTrigger(body):
	if body.get_name() == "Player":
		print("Starte Level Tutorial Real 2")
		$Tutorial.transition_to_Real_2()#Muss ich noch weiter machen
