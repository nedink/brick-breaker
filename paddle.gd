extends KinematicBody2D

class_name Paddle

var displace:float
var movement:Vector2


func _physics_process(delta):
	if Input.is_action_pressed("right"):
		displace = 1
	if Input.is_action_pressed("left"):
		displace = -1
	if displace:
		movement = move_and_slide(Vector2(displace / delta, 0))
		displace = 0
		


func _input(event):
	if event is InputEventMouseMotion:
		displace = event.relative.x
#		displace = get_global_mouse_position().x - global_position.x




