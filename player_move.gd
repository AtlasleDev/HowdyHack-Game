extends Camera2D

func _process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
		$Player.play("default")
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
		$Player.play("default")
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
		$Player.play("default")
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
		$Player.play("default")

		# Normalize the direction vector to prevent faster diagonal movement
	if direction.length() > 0:
		direction = direction.normalized()
	global_position += direction * 200 * delta
