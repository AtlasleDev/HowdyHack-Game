extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("Rocket")
	await $AnimationPlayer.animation_finished
	%CutsceneCam.enabled = false
	%PlayerCam.enabled = true
	await get_tree().create_timer(3.0).timeout
	%MissRev1_png.visible = true
	Globals.sayText.emit("Rev: Oh, sorry about that! Can't trust TU craftsmenship afterall. I'm Revellie! And we need new parts. Lets go to that house over there!")
