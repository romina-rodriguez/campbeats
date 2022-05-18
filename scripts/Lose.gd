extends Control



func _on_again_pressed():
	get_tree().change_scene("res://scenes/levels/Main.tscn")

func _on_quit_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")
