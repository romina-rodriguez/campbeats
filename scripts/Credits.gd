extends Control



func _on_back_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")


func _on_LinkButton_pressed():
	OS.shell_open("https://lhteam.itch.io/finn-sprite")
