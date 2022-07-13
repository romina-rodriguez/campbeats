extends CanvasLayer

var cd_time = 3 #countdown time

signal cd_start

func _ready():
	if not cd_time == 0:
		$Sound_cd.play()
		$Label.text = String(cd_time) + "!"
		$Timer.start()
	else:
		emit_signal("cd_start")
		$Label.text = "START!"
		$Timer.stop()
		yield(get_tree().create_timer(1), "timeout")
		$Label.text = ""


func _on_Timer_timeout():
	cd_time -= 1
	_ready()

