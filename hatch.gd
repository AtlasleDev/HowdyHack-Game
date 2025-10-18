extends Sprite2D

var enter = false

func _on_area_2d_mouse_entered() -> void:
	enter = true

func _on_area_2d_mouse_exited() -> void:
	enter = false

var defaultx = position.x
var going = false

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() && enter:
			going = true

func _physics_process(_delta: float) -> void:
	if going:
		position.x = clamp(get_viewport().get_mouse_position().x,-319,-108)
