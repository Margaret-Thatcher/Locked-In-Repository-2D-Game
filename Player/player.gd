extends CharacterBody2D

@export var speed = 100


func _physics_process(delta):
	# left and right
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk_right")
	elif Input.is_action_pressed("move_left"):
		velocity.x = -speed
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walk_right")
	else:
		velocity.x = 0

	# up and down
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
		$AnimatedSprite2D.play("walk_down")
	elif Input.is_action_pressed("move_up"):
		velocity.y = -speed
		$AnimatedSprite2D.play("walk_up")
	else:
		velocity.y = 0

	# not moving
	if velocity == Vector2(0,0):
		$AnimatedSprite2D.play("idle")

	move_and_slide()
