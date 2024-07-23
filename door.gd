extends Node2D


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		if Key.key_collected:
			#print("You win")
			get_tree().change_scene("res://main.tscn")
	
