extends Control


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Label.text = "You won! Your final score was " + str(Global.score)


func _on_Play_pressed():
	get_tree().change_scene("res://Assets/3D-Character-main/Game.tscn")
	Global.reset()

func _on_Quit_pressed():
	get_tree().quit()
