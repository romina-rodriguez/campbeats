extends Control




func _on_next_pressed():
	get_tree().change_scene("res://scenes/levels/Level2.tscn")


func _on_quit_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")
