extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Globals.intro == true:
		$AnimationPlayer.play("Rocket")
		await $AnimationPlayer.animation_finished
		%CutsceneCam.enabled = false
		%PlayerCam.enabled = true
		await get_tree().create_timer(3.0).timeout
		%MissRev1_png.visible = true
		Globals.intro = false
		Globals.sayText.emit("Rev: Oh, sorry about that! Can't trust TU craftsmenship afterall.@I'm Revellie! And welcome to UT Island.@It is a rather dreary place...@But I digress. We need rocket parts!@Lets go into that house over there.")
	else:
		%PlayerCam.position = Vector2(-26,-533)
		%Player.visible = true
		%CutsceneCam.enabled = false
		%PlayerCam.enabled = true
