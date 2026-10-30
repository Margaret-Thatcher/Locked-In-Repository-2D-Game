extends AnimatedSprite2D

var collected = false
func _ready():
	$FlipSound.finished.connect(_on_audio_finished)

func _on_area_2d_body_entered(body):
	if body.is_in_group("player") and collected == false:
		collected = true
		body.add_book()
		$FlipSound.play()
		play("collect")

func _on_animation_finished():
	if animation == "collect":
		hide()

func _on_audio_finished():
	queue_free()
