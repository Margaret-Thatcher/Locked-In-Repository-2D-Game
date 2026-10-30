extends AnimatedSprite2D

var collected = false


func _on_area_2d_body_entered(body):
	if body.is_in_group("player") and collected == false:
		collected = true
		body.add_book()
		$Flip.play()
		play("collect")


func _on_animation_finished():
	if animation == "collect":
		queue_free()
