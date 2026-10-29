extends Node2D

@onready var jumpscare = $AnimatedSprite2D
@onready var jumpscare_sound = $JumpscareSound

func play_jumpscare():
	jumpscare.play("jumpscare")
	jumpscare_sound.play()
