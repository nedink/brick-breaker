extends Position2D

export var ball_count = 1
export var wait_time = 1.0
export var initial_impulse = Vector2()

var ball_scene = preload("res://Ball.tscn")


func _ready():
	$Timer.wait_time = wait_time
	$Timer.start()
	spawn_ball()


func _on_Timer_timeout():
	spawn_ball()



func spawn_ball():
	if ball_count > 0:
		var ball = ball_scene.instance()
		ball.apply_central_impulse(initial_impulse)
		ball_count -= 1
		ball.position = position
		get_tree().root.get_node("Main").add_child(ball)
#		add_child(ball)
#		ball.set_as_toplevel(true)
	else:
		queue_free()
