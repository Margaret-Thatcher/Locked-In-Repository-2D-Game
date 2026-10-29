extends AnimatedSprite2D


func _on_animation_finished():
	if animation == "jumpscare":
		get_tree().change_scene_to_file("res://Screens/game_over.tscn")
