extends Camera2D

func _process(delta):
	var direction = Vector2.ZERO
	
	var moving = false

	if Input.is_action_pressed("ui_up"):
		moving = true
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		moving = true
		direction.y += 1
	if Input.is_action_pressed("ui_left"):
		moving = true
		direction.x -= 1
		$Player.flip_h = 1
	if Input.is_action_pressed("ui_right"):
		moving = true
		direction.x += 1
		$Player.flip_h = 0
		
	if moving:
		$Player.play("default")
	elif !moving:
		$Player.stop()
		$Player.play("Idle")

		# Normalize the direction vector to prevent faster diagonal movement
	if direction.length() > 0:
		direction = direction.normalized()
	global_position += direction * 200 * delta
