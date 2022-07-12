extends CanvasLayer

var notes = 0
var dash = 3

func _ready():
	if notes < 10 and dash < 10:
		$Notes.text = "0" + String(notes)
		$Dash.text = "0" + String(dash)
	else:
		$Notes.text = String(notes)
		$Dash.text = String(dash)

func _on_MusicNote_collected():
	notes += 1
	_ready()


func _on_Player_dash_made():
	if dash > 0:
		dash -= 1
	_ready()


func _on_Box_note_collected():
	notes += 1
	_ready()


func _on_Menu_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")
	

func get_notes():
	return notes
