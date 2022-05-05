extends KinematicBody2D


var lineal_vel= Vector2.ZERO
var SPEED = 300
var JUMP_SPEED = 300
var JUMP_FORCE = 1.2
var GRAVITY = 500
var POWER_UP = false

var _facing_right = true
var ATTACK = false

onready var playback = $AnimationTree.get("parameters/playback")
var timee = 1

func _physics_process(delta):
	var on_floor = is_on_floor()
	lineal_vel = move_and_slide(lineal_vel, Vector2.UP)
	
	lineal_vel.y += GRAVITY * delta
	
	var target_vel = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	lineal_vel.x = lerp(lineal_vel.x, target_vel * SPEED, 0.5)
	if ATTACK == false:
		if on_floor:
			if abs(lineal_vel.x) > 10:
				if POWER_UP == true:
					playback.travel("dash_run")
				else:
					playback.travel("run")
			else:
				if POWER_UP == true:
					playback.travel("dash_idle")
				else:
					playback.travel("idle")
		else:
			if POWER_UP == true:
				playback.travel("dash_jump")
			else:
				playback.travel("jump")

func _input(event):
	var on_floor = is_on_floor()
	
	# Animations
	if Input.is_action_just_pressed("attack"):
		
		playback.travel("attack")
		ATTACK = true
		yield(get_tree().create_timer(0,75),"timeout")
		ATTACK = false
		return
		
	if Input.is_action_just_pressed("left") and _facing_right:
		_facing_right = false
		scale.x = -1
	if Input.is_action_just_pressed("right") and not _facing_right:
		_facing_right = true
		scale.x = -1
	if Input.is_action_just_pressed("dash"):
		SPEED = 600
		POWER_UP = true
		yield(get_tree().create_timer(10),"timeout")
		POWER_UP = false
		SPEED = 300
	if Input.is_action_just_pressed("jump") and on_floor :
		lineal_vel.y = -JUMP_SPEED*JUMP_FORCE


#	var on_floor = is_on_floor()


#	if Input.is_action_just_pressed("attack"):
#		print("ataque")
#		playback.travel("attack")
#		print(playback.get_current_node())


func _on_fallzone_body_entered(body):
	get_tree().change_scene("res://scenes/Main.tscn")
