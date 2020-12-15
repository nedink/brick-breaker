extends Node2D

class_name Main


export var level = 1

enum State {
	SERVE,
	PLAY
}

var state setget set_state
var ball_scene = preload("res://Ball.tscn")
var ball
var ball_spawner_scene = preload("res://BallSpawner.tscn")




func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	set_state(State.SERVE)
	
	var level_scene = load("res://levels/" + str(level) + ".tscn")
	var level = level_scene.instance()
	add_child(level)



func _process(delta):
	if Input.is_action_just_pressed("cancel"):
		get_tree().quit()


func _input(event):
	if event.is_action_pressed("primary"):
		if state == State.SERVE:
			set_state(State.PLAY)



func set_state(s) -> void:
	state = s
	
	if s == State.SERVE:
		print("serve")
		# arrest mouse
#		Input.warp_mouse_position(Vector2(240, 160))
#		$Label.text = str(get_viewport_rect().end / 2)
#		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		# stop movement
		$Paddle.set_physics_process(false)
		# go to center
		$Paddle.position.x = 240
		# rotate indicator to up
		$Paddle/Indicator.rotation = -PI/2
		# show indicator
		$Paddle/Indicator.show()
		# spawn ball at serve position
	
	if s == State.PLAY:
		# hide indicator
		$Paddle/Indicator.hide()
		# activate ball spawner
		
		# spawn ball in direction of indicator
		var ball_spawner = ball_spawner_scene.instance()
		ball_spawner.position = $Paddle.position
		ball_spawner.initial_impulse = (Vector2.RIGHT * 200).rotated($Paddle/Indicator.rotation)
		ball_spawner.wait_time = 0.1
		add_child(ball_spawner)

#		ball = ball_scene.instance()
#		ball.position = $Paddle.position
#		add_child(ball)
#		ball.apply_central_impulse((Vector2.RIGHT * 200).rotated($Paddle/Indicator.rotation))

#		if ball:
#			ball.set_as_toplevel(true)
#			ball.apply_central_impulse((Vector2.RIGHT * 200).rotated($Paddle/Indicator.rotation))
		
		# enable physics
		$Paddle.set_physics_process(true)
		
