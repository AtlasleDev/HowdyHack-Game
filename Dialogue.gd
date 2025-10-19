extends ColorRect

var waiting_for_dialogue_input = false
func _ready() -> void:
	Globals.sayText.connect(texty)

func texty(text) -> void:
	$text.text = ""
	visible = true
	$AnimationPlayer.play("Textboxmove")
	for i in range(len(text)):
		$text.text = $text.text + text[i]
		await get_tree().create_timer(0.05).timeout
	waiting_for_dialogue_input = true

func _unhandled_input(event):
	if waiting_for_dialogue_input and event.is_action_pressed("ui_accept"):
		waiting_for_dialogue_input = false
		$AnimationPlayer.play("Textboxmove2")
		await $AnimationPlayer.animation_finished
		%MissRev1_png.visible = false
		visible = false
