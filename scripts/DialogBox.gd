extends Control

var dialog = [
	"The music is back!!!", 
	"Thank you so much for helping me on this quest :)", 
	"I hope you had as much fun as I did!",
	"See you next time!!"
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
		global_var.story_fin += 1
		get_tree().change_scene("res://scenes/levels/level5/Win5.tscn")
	dialog_index += 1


func _on_Tween_tween_completed(object, key):
	finished = true
