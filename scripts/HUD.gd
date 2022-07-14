extends CanvasLayer

var notes = 0
var dash = 3

func _ready():
	$Dash.text = "0" + String(dash)
	if notes < 10:
		$Notes.text = "0" + String(notes)
	else:
		$Notes.text = String(notes)

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
