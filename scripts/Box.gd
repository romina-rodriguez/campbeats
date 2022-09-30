extends Area2D

onready var playback = $AnimationTreeBox.get("parameters/playback")

signal note_collected

func _ready():
	add_to_group("hitbox")

func take_damage():
	playback.travel("hit")
	playback.travel("note")
	emit_signal("note_collected")
	$SoundCollect.play()
	#$SoundCollect.play()
