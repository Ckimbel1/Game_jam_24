extends Node2D


var key_collected = false

func _on_collection_area_body_entered(body):
	if body.name == "Player":
		print("Key Collected")
		key_collected = true
		var tween = create_tween()
		
		tween.tween_property(self, "position", position + Vector2(0,-30), .5)
		tween.tween_property(self, "modulate:a",0.0, 0.5)
		
		
		tween.tween_callback(self.queue_free) #Removes key from screen
