extends Node2D

var pause_st = true

func _ready():
	get_tree().paused = pause_st
	


func _on_Countdown_cd_start():
	pause_st = false
	_ready()
