extends Control


func _on_next_pressed():
	get_tree().change_scene("res://scenes/levels/level5/Level5.tscn")

func _on_quit_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")

func _on_levels_pressed():
	get_tree().change_scene("res://scenes/Levels.tscn")
