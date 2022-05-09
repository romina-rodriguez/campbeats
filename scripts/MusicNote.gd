extends Area2D

var TIME = 3
var ACTIVATE = false
onready var playback = $AnimationTree.get("parameters/playback")

signal note_collected

func _on_MusicNote_body_entered(body):
	if(ACTIVATE):
		
		playback.travel("get")
		emit_signal("note_collected")
		body.add_note()
		$SoundCollect.play()
		
	
var time_start = OS.get_unix_time()
var time_now = 0

func _process(delta):
	time_now = OS.get_unix_time()
	var time_elapsed = time_now - time_start
	if(TIME<time_elapsed and ACTIVATE == false):
		ACTIVATE=true
		playback.travel("available")
		
func _on_CollectNote_animation_finished(anim_name):
	queue_free()
	
