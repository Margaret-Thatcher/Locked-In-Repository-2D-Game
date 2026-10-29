extends AnimatedSprite2D

@onready var jumpscare_sound = get_node("../JumpscareSound")

func _ready():
	play_jumpscare()

func play_jumpscare():
	play("jumpscare")
	jumpscare_sound.play()

func _on_animation_finished():
	if animation == "jumpscare":
		get_tree().change_scene_to_file("res://Screens/game_over.tscn")
