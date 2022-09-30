extends Control


var som = global_var.story_rdy

func _ready():
	pass


func _on_play_pressed():
	if som==0:
		global_var.story_rdy+=1
		get_tree().change_scene("res://scenes/Story.tscn")
	else:
		get_tree().change_scene("res://scenes/levels/level1/Main.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _on_credits_pressed():
	get_tree().change_scene("res://scenes/Credits.tscn")


func _on_DialogBox_story():
	pass # Replace with function body.
