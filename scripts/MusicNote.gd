extends Area2D

func _on_MusicNote_body_entered(_body):
	$CollectNote.play("collectedBounce")
	$SoundCollect.play()
	

func _on_CollectNote_animation_finished(anim_name):
	queue_free()
