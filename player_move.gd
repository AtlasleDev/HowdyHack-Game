extends Camera2D

var debounce = false
var dialogueStop = false

func _ready():
	await get_tree().create_timer(1.0).timeout
	debounce = false

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
	
	if Input.is_action_pressed("ui_accept"):
		if position.x >= -46 && position.x <= 1 && position.y >= -638 && position.y <= -598:
			if !debounce:
				get_tree().change_scene_to_file("res://inside.tscn")
				%MissRev1_png.visible = false
				debounce = true
		elif position.x >= -317 && position.x <= -140 && position.y >= -230 && position.y <= -188:
			if !debounce:
				get_tree().change_scene_to_file("res://island.tscn")
				debounce = true
		elif position.x >= 346 && position.x <= 394 && position.y >= 148 && position.y <= 247:
			if !dialogueStop:
				Globals.sayText.emit("Oh, hello.#Wouldn't it be nice to say hello back?#Type a print statement.&")
				dialogueStop = true
	
	if moving:
		$Player.play("default")
	elif !moving:
		$Player.stop()
		$Player.play("Idle")

		# Normalize the direction vector to prevent faster diagonal movement
	if direction.length() > 0:
		direction = direction.normalized()
		print(position.x, " ", position.y)
	global_position += direction * 200 * delta
