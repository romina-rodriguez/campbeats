extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var lineal_vel= Vector2.ZERO
var SPEED = 300
var GRAVITY = 500

var _facing_right = true

onready var playback = $AnimationTree.get("parameters/playback")

func _physics_process(delta):
	
	var on_floor = is_on_floor()
	
	lineal_vel = move_and_slide(lineal_vel, Vector2.UP)
	
	lineal_vel.y += GRAVITY * delta
	
	var target_vel = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	lineal_vel.x = lerp(lineal_vel.x, target_vel * SPEED, 0.5)
	
	if Input.is_action_just_pressed("jump") and on_floor :
		lineal_vel.y = -SPEED
		
	# Animations
	if on_floor:
		if abs(lineal_vel.x) > 10:
			playback.travel("run")
		else:
			playback.travel("idle")
	else:
		playback.travel("jump")
	
	if Input.is_action_just_pressed("attack"):
		print("paso1")
		playback.travel("attack")
	
	if Input.is_action_just_pressed("left") and _facing_right:
		_facing_right = false
		scale.x = -1
		
	if Input.is_action_just_pressed("right") and not _facing_right:
		_facing_right = true
		scale.x = -1
	

		
