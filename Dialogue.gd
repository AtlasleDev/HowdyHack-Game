extends ColorRect

# Called when the node enters the scene tree for the first time.
func texty(text) -> void:
	$text.text = text
	visible = true
	$AnimationPlayer.play("Textboxmove")
