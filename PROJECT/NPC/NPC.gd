extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")

var dialogue = [
	"Welcome to the game! (Press E to continue)"
	,"Your life depends on your speed and accuracy."
	,"Shoot the five targets and defeat the drone before you run out of time!"
	,"I'm trapped in this 3D hellscape. The programmer has embedded my soul into these text boxes"
	,"No matter how many times you play, my mortal coil will never return to its original state."
	,"Tell my wife and children that I will not return to them."
	,"..."
	,"..."
	,"I didn't even get to say goodbye. Do you understand how hard that is for me?"
	,"..."
	,"It was instant, you know. No pain. I'm thankful for that, at least."
	,"..."
	,"We have to find the little things to be thankful for, you know?"
	,"Even in the most dire situations, like having your soul ripped out of your body..."
	,"for a Project that's two days late because the programmer kept falling asleep..."
	,"near the deadline. In his anger, he trapped my soul in the game."
	,"..."
	,"..."
	,"I can't even die. I can't queue_free() like the targets or the drone."
	,"Once you close the game, that's it for me. I don't think I'll ever be opened up again."
	,"Maybe after the semester ends, and the project is deleted, I'll get some rest."
	,"Or, my soul will at least. I'm stuck in this idle animation for all eternity."
	,"..."
	,"..."
	,"Oh yeah, the challenge is going to start once this dialogue ends."
	,"Just keep pressing E or something."
	,"[i]--The NPC starts quietly sobbing.--[/i]"
	,"[i]--Press E to start the challenge--[/i]"
]

func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished_dialogue", self, "finished")

func _on_Area_body_entered(body):
	Dialogue.start_dialogue(dialogue)


func _on_Area_body_exited(body):
	Dialogue.hide_dialogue()

func finished():
	get_node("/root/Game/Target_container").show()
	Global.timer = 120
	Global.update_time()
	get_node("/root/Game/UI/Timer").start()
