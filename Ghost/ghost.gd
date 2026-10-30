extends Area2D

<<<<<<< HEAD
@export var speed = 0.75
@export var patrol = 100
=======
@export var speed = 1
@export var patrol = 150
>>>>>>> 60ed7b65eaeb1d980e2a3e80ab0fe83ca4ccb3b9
var state = "idle"
var target
var start_position
var direction = 1


func _ready():
	start_position = global_position


func _physics_process(delta):
	match state:
		"idle":
			# float up and down, and go back to its line after a chase
			global_position.y += speed * direction
			if global_position.y > start_position.y + patrol:
				direction = -1
			elif global_position.y < start_position.y - patrol:
				direction = 1

			if global_position.x > start_position.x:
				global_position.x -= speed
			elif global_position.x < start_position.x:
				global_position.x += speed
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
