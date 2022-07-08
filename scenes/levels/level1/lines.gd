tool
extends Node2D

export (int) var bpm = 5 setget set_bpm
export (float) var song_length setget set_song_length
export (int) var crotchet_size setget set_crotchet_size
export (Color) var color = Color.blue setget set_color
export (int) var offset setget set_offset


func _draw():
	var bpm = 90
	var song_length = 75
	var crotchet_size = 30
	var offset = 1
	var crotchet_n = ceil(song_length * (bpm / 60.0))
	for i in crotchet_n:
		var h_pos = offset + crotchet_size * i
		draw_line(Vector2(h_pos, 0), Vector2(h_pos, 3000), color)

func set_bpm(value):
  bpm = value
  update()
  
func set_song_length(value):
  song_length = value
  update()
  
func set_crotchet_size(value):
  crotchet_size = value
  update()
  
func set_color(value):
  color = value
  update()
  
func set_offset(value):
  offset = value
  update()
