extends Area2D

var _target = null
onready var playback = $AnimationTreeBox.get("parameters/playback")


func _on_Box_body_entered(body):
	_target = body


func _on_Player_attack_made():
	if(_target): 
		playback.travel("hit")
		yield(get_tree().create_timer(0,4),"timeout") # 0,4 dura la animacion
		queue_free()


func _on_Box_body_exited(body):
	_target = null
