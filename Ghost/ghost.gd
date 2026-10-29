extends Area2D

@export var speed = 1
var state = "idle"
var target


func _physics_process(delta):
	match state:
		"idle":
			pass
		"chasing":
			# move towards the player
			if target.global_position.x > global_position.x:
				global_position.x += speed
			elif target.global_position.x < global_position.x:
				global_position.x -= speed

			if target.global_position.y > global_position.y:
				global_position.y += speed
			elif target.global_position.y < global_position.y:
				global_position.y -= speed


func _on_vision_body_entered(body):
	if body.is_in_group("player"):
		target = body
		state = "chasing"
		print("ghost sees you")


func _on_vision_body_exited(body):
	if body.is_in_group("player"):
		state = "idle"


func _on_body_entered(body):
	if body.is_in_group("player"):
		get_tree().call_deferred("change_scene_to_file", "res://Jumpscare/jumpscare.tscn")
