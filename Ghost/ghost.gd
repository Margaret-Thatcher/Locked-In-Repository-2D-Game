extends Area2D

@export var speed = 0.75
@export var patrol = 100
var state = "idle"
var target
var start_x
var direction = 1


func _ready():
	start_x = global_position.x


func _physics_process(delta):
	match state:
		"idle":
			# float back and forth
			global_position.x += speed * direction
			if global_position.x > start_x + patrol:
				direction = -1
			elif global_position.x < start_x - patrol:
				direction = 1
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
