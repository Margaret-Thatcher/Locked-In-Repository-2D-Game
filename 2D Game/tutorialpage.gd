extends Control


func _input(event):
	if event is InputEventKey:
		if event.pressed and not event.echo and event.keycode == KEY_SPACE:
			get_viewport().set_input_as_handled()
			get_tree().change_scene_to_file("res://start_screen.tscn")
