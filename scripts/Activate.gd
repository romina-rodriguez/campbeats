extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"




var SPEED = 100
var direction = Vector2.RIGHT
var LIMIT = 3100
func _process(delta):
	
	if(self.position.x<LIMIT):
		translate(SPEED * delta * direction)
