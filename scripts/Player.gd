extends KinematicBody2D


var lineal_vel= Vector2.ZERO
var SPEED = 310
var JUMP_SPEED = 300
var JUMP_FORCE = 2.2
var GRAVITY = 1500
var POWER_UP = false
var notes = 0
var _facing_right = true
var ATTACK = false
var DASH = 3

onready var playback = $AnimationTree.get("parameters/playback")
var time = 1

signal dash_made

func _ready():
	pass

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
	if Input.is_action_just_pressed("dash") and DASH > 0:
		SPEED = 370
		GRAVITY = 3200
		JUMP_FORCE = 3.5
		POWER_UP = true
		emit_signal("dash_made")
		yield(get_tree().create_timer(5),"timeout")
		DASH -= 1
		POWER_UP = false
		SPEED = 300
		GRAVITY = 1500
		JUMP_FORCE = 2.2
	if Input.is_action_just_pressed("jump") and on_floor :
		lineal_vel.y = -JUMP_SPEED*JUMP_FORCE

func _on_SwordHit_area_entered(area):
	if area.is_in_group("hitbox"):
		area.take_damage()

func _on_MusicNote_collected():
	pass # Replace with function body.

# LEVEL 5

func _on_fallzone_body_entered5(body):
	get_tree().change_scene("res://scenes/levels/level5/Lose5.tscn")

func _on_Menu_pressed5():
	get_tree().change_scene("res://scenes/levels/level5/Menu5.tscn")

func _on_levelEnd_body_entered5(body):
	if get_node("../HUD").get_notes() >= 21: # cambiar cantidad de notas segun nivel
		if global_var.story_fin == 0:
			get_tree().change_scene("res://scenes/Finish.tscn")
		else:
			get_tree().change_scene("res://scenes/levels/level5/Win5.tscn")
	else:
		get_tree().change_scene("res://scenes/levels/level5/Lose5.tscn")

# LEVEL 4

func _on_fallzone_body_entered4(body):
	get_tree().change_scene("res://scenes/levels/level4/Lose4.tscn")

func _on_levelEnd_body_entered4(body):
	if get_node("../HUD").get_notes() >= 6: # cambiar cantidad de notas segun nivel
		get_tree().change_scene("res://scenes/levels/level4/Win4.tscn")
	else:
		get_tree().change_scene("res://scenes/levels/level4/Lose4.tscn")

func _on_Menu_pressed4():
	get_tree().change_scene("res://scenes/levels/level4/Menu4.tscn")

# LEVEL 3

func _on_fallzone_body_entered3(body):
	get_tree().change_scene("res://scenes/levels/level3/Lose3.tscn")

func _on_levelEnd_body_entered3(body):
	if get_node("../HUD").get_notes() >= 23: # cambiar cantidad de notas segun nivel
		get_tree().change_scene("res://scenes/levels/level3/Win3.tscn")
	else:
		get_tree().change_scene("res://scenes/levels/level3/Lose3.tscn")

func _on_Menu_pressed3():
	get_tree().change_scene("res://scenes/levels/level3/Menu3.tscn")
	
# LEVEL 2

func _on_levelEnd_body_entered2(body):
	if get_node("../HUD").get_notes() >= 6: # cambiar cantidad de notas segun nivel
		get_tree().change_scene("res://scenes/levels/level2/Win2.tscn")
	else:
		get_tree().change_scene("res://scenes/levels/level2/Lose2.tscn")

func _on_fallzone_body_entered2(body):
	get_tree().change_scene("res://scenes/levels/level2/Lose2.tscn")

func _on_Menu_pressed2():
	get_tree().change_scene("res://scenes/levels/level2/Menu2.tscn")
	
# LEVEL 1

func _on_fallzone_body_entered1(body):
	get_tree().change_scene("res://scenes/levels/level1/Lose1.tscn")

func _on_levelEnd_body_entered1(body):
	if get_node("../HUD").get_notes() >= 22: # cambiar cantidad de notas segun nivel
		get_tree().change_scene("res://scenes/levels/level1/Win1.tscn")
	else:
		get_tree().change_scene("res://scenes/levels/level1/Lose1.tscn")

func _on_Menu_pressed1():
	get_tree().change_scene("res://scenes/levels/level1/Menu1.tscn")
