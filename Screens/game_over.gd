extends Control


func _on_try_again_button_down():
	get_tree().change_scene_to_file("res://Library/library.tscn")
