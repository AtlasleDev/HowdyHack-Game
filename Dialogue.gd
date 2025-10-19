extends ColorRect

var theRest = ""
var showRev = false
var newDia = false
var waiting_for_dialogue_input = false
func _ready() -> void:
	Globals.sayText.connect(texty)

func texty(text) -> void:
	if showRev:
		if $MissRev1_png.visible == true:
			$MissRev1_png.visible = false
			showRev = false
		else:
			$MissRev1_png.visible = true
			showRev = false
	$text.text = ""
	visible = true
	$AnimationPlayer.play("Textboxmove")
	for i in range(len(text)):
		if text[i] == "@":
			$text.text = $text.text.replace("@", "")
			newDia = true
			theRest = text.substr(i+1, len(text))
			break
		if text[i] == "#":
			$text.text = $text.text.replace("#", "")
			newDia = true
			theRest = text.substr(i+1, len(text))
			showRev = true
			break
		if text[i] == "&":
			$text.text = $text.text.replace("&", "")
			Globals.printGame.emit("print('Hello!')")
			break
		$text.text = $text.text + text[i]
		await get_tree().create_timer(0.05).timeout
	waiting_for_dialogue_input = true

func _unhandled_input(event):
	if waiting_for_dialogue_input and event.is_action_pressed("ui_accept") and !newDia:
		waiting_for_dialogue_input = false
		$AnimationPlayer.play("Textboxmove2")
		await $AnimationPlayer.animation_finished
		%MissRev1_png.visible = false
		visible = false
	elif waiting_for_dialogue_input and event.is_action_pressed("ui_accept") and newDia:
		waiting_for_dialogue_input = false
		newDia = false
		texty(theRest)
