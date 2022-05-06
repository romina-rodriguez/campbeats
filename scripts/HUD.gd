extends CanvasLayer

var notes = 0

func _ready():
	if notes < 10:
		$Notes.text = "0" + String(notes)
	else:
		$Notes.text = String(notes)

func _on_MusicNote_collected():
	notes += 1
	_ready()
