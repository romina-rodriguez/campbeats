extends Control



func _on_back_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")

func _on_LinkButton1_pressed():
	OS.shell_open("https://lhteam.itch.io/finn-sprite")


func _on_LinkButton2_pressed():
	OS.shell_open("https://tallbeard.itch.io/three-red-hearts-prepare-to-dev")


func _on_LinkButton3_pressed():
	OS.shell_open("https://ngndang.itch.io/fat-pix-font")


func _on_LinkButton4_pressed():
	OS.shell_open("https://grafxkid.itch.io/seasonal-tilesets")


func _on_LinkButton5_pressed():
	OS.shell_open("https://pixelfrog-assets.itch.io/pixel-adventure-1")
