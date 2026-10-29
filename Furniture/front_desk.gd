extends StaticBody2D


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		if body.books >= 5:
			get_tree().call_deferred("change_scene_to_file", "res://Screens/win_screen.tscn")
		else:
			$Label.show()


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		$Label.hide()
