extends Area2D


func trapEnter( area ):
	if area.get_name() == "Player":
		print("Spieler ist gestorben!");
		#Spieler sterben lassen / respawnen
		area.queue_free()
