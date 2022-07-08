extends Area2D

var TIME = 3
var ACTIVATE = 0
var USER_GET = 0
onready var playback = $AnimationTree.get("parameters/playback")

signal note_collected


func _on_MusicNote_body_entered(body):
	print(body.name)
	if(ACTIVATE==0 and body.name=="Activate"):
		ACTIVATE=1
		playback.travel("available")
		yield(get_tree().create_timer(1),"timeout")
		if(USER_GET==0):
			playback.travel("idle")
			ACTIVATE=0
	elif(ACTIVATE==1 and body.name=="Player" and playback.get_current_node() == "available"):
		USER_GET = 1
		playback.travel("get")
		emit_signal("note_collected")
		body.add_note()
		$SoundCollect.play()
		
	

		
func _on_CollectNote_animation_finished(anim_name):
	queue_free()
	
