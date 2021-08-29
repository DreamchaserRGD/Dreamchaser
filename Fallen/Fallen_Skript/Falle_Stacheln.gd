extends Area2D

var conDamage = false;
var damage = 10;

func trapEnter( area ):
	if area.get_name() == "Player":
		print("Spieler wird Schaden erleiden!");
		conDamage = true;
		doDamage()

func trapExit( area ):
	if area.get_name() == "Player":
		conDamage = false;
		print("Spieler erleidet keinen Schaden mehr!");

func doDamage():
	while conDamage:
		yield(get_tree().create_timer(1), "timeout")
		print("Spieler erleidet Schaden!")
	
