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


func _on_LinkButton_pressed():
	OS.shell_open("https://coloralpha.itch.io/50-menu-interface-sfx")


func _on_LinkButtonm3_pressed():
	OS.shell_open("https://freemusicarchive.org/music/8bit_Betty/too_bleep_to_bloop/hc152_03_nikomas_theme_extended_mix_by_8bit_betty/")


func _on_LinkButtonf2_pressed():
	OS.shell_open("https://fontlibrary.org/en/font/rich-eatin")
