extends Control

var dialog = [
	"Hi! I’m Jimmy", 
	"I live in the flowery valley near the enchanted forest", 
	"Many people say it’s a very dangerous place",
	"Leyends tell that there you can find all the seasons of the year",
	"Moreover, there are people who say that you can even find a beach if you go deep enough",
	"Funny, isn’t it?",
	"Well, to get straight to the point...",
	"A few days ago, while I was resting on the valley, my radio stopped working",
	"I tried changing the batteries, but it didn’t work",
	"The music had disappear, what a tragedy!!!",
	"Later, I realized that music could be heard coming from the forest. So, I grabbed my sword and I got closer",
	"And you’re not gonna believe this, but there was a path of musical notes!!!!",
	"I’m sure that wherever this path leads me to, I will end up finding the missing music",
	"Would you like to help me on this quest?",
	"It's that a yes? Then let's go!!!"
]

var dialog_index = 0
var finished = false
#onready var playback = $Sprite/AnimationTree.get("parameters/playback")



func _ready():
	
	load_dialog()
	
func _process(delta):
	$next_indicator.visible = finished
	
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()
	
func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel,"percent_visible", 0, 1, 1,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else: 
		get_tree().change_scene("res://scenes/levels/level1/Main.tscn")
	dialog_index += 1


func _on_Tween_tween_completed(object, key):
	finished = true
