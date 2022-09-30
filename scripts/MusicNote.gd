extends Area2D

var TIME = 3
var ACTIVATE = 0
var USER_GET = 0
var ON_AREA_USER = 0
onready var playback = $AnimationTree.get("parameters/playback")

signal note_collected



func _on_MusicNote_body_entered(body):
	if(body.name=="Player"):
		ON_AREA_USER = 1
	if(ACTIVATE==0 and body.name=="Activate"):
		ACTIVATE=1
		playback.travel("available")
		if(ON_AREA_USER==1):
			USER_GET = 1
			playback.travel("get")
			emit_signal("note_collected")
			$SoundCollect.play()
		yield(get_tree().create_timer(1),"timeout")
		if(USER_GET==0):
			playback.travel("idle")
			ACTIVATE=2
	else:
		if(body.name=="Player" and ACTIVATE == 1):
				USER_GET = 1
				playback.travel("get")
				emit_signal("note_collected")
				$SoundCollect.play()

func _on_MusicNote_body_exited(body):
	if(body.name=="Player"):
		ON_AREA_USER = 0

		
func _on_CollectNote_animation_finished(anim_name):
	queue_free()
	


