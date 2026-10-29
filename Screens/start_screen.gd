extends Control


func _on_start_button_down():
	get_tree().change_scene_to_file("res://Library/library.tscn")


func _on_tutorial_button_down():
	$Main.hide()
	$HowToPlay.show()


func _on_back_button_down():
	$Main.show()
	$HowToPlay.hide()
