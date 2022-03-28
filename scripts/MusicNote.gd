extends Area2D

func _on_MusicNote_body_entered(_body):
	queue_free()
