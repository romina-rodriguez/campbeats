extends Area2D

var _target = null
onready var playback = $AnimationTreeBox.get("parameters/playback")

#func _physics_process(delta):
#	if(_target): # falta revisar que el jugador haya hecho un ataque
#		playback.travel("hit")
#		yield(get_tree().create_timer(2),"timeout")
#		queue_free()

func _on_Box_body_entered(body):
	#_target = body
	if(body.get_attack()):
		playback.travel("hit")
		yield(get_tree().create_timer(0,4),"timeout") # 0,4 dura la animacion
		queue_free()
