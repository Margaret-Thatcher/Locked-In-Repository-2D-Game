extends AnimatedSprite2D

@onready var jumpscare_sound = get_node("../JumpscareSound")

func _ready():
	play_jumpscare()

func play_jumpscare():
	play("jumpscare")
	jumpscare_sound.play()

# go to game over once the scream is done
func _on_jumpscare_sound_finished():
	get_tree().change_scene_to_file("res://Screens/game_over.tscn")
