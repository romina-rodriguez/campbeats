extends Control



func _on_again_pressed():
	get_tree().change_scene("res://scenes/levels/level2/Level2.tscn")

func _on_quit_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")

func _on_levels_pressed():
	get_tree().change_scene("res://scenes/Levels.tscn")
