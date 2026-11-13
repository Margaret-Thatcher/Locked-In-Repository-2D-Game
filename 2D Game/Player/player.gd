extends CharacterBody2D

@export var speed = 100
var books = 0
var desk


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
		$Footsteps.stop()
	elif $Footsteps.playing == false:
		$Footsteps.play()

	move_and_slide()

	# point the arrow at the front desk
	if books >= 5:
		$Arrow.look_at(desk.global_position)


func add_book():
	books += 1
	$CanvasLayer/HBoxContainer/Books.text = "Books: " + str(books) + "/5"
	if books == 5:
		desk = get_node("../FrontDesk")
		$CanvasLayer/ReturnMessage.show()
		$Arrow.show()
