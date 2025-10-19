extends TextEdit

var Newanswer = 1

var answerWe = ""

func _ready() -> void:
	Globals.printGame.connect(printgam)

func printgam(answer):
	text = ""
	visible = true
	$MenuOpem.play()
	answerWe=answer

func _on_text_changed() -> void:
	if text == answerWe:
		$Confirm.play()
		visible = false
		text = ""
		Newanswer += 1
		newdiaL()

func newdiaL():
	if Newanswer == 2:
		Globals.sayText.emit("Hey, uh. Isn't that your rocket?@Doesn't matter. What is it you're looking for?#We can keep using the print command to say what we want to say to him.@Let him know we want some wires.#PRINT: I AM LOOKING FOR A PLACE TO GET SPARE WIRES&print('I am looking for a place to get spare wires.')")
	if Newanswer == 3:
		Globals.sayText.emit("Sure, talk to that baker in that builder over yonder.@Im sure they'll need the help.#Great! Let's get going!")
