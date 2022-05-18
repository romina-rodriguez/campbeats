extends Area2D

onready var playback = $AnimationTreeBox.get("parameters/playback")

signal note_collected

func _ready():
	add_to_group("hitbox")

func take_damage():
	playback.travel("hit")
	yield(get_tree().create_timer(0,4),"timeout") # 0,4 dura la animacion
	emit_signal("note_collected")
	#$SoundCollect.play()
	queue_free()
