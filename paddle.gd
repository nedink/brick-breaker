extends KinematicBody2D

class_name Paddle



func _physics_process(delta):
	var displace = $MouseMotionTracker.global_position.x - global_position.x

	var movement = move_and_slide(Vector2(displace / delta, 0))
	
	
	
#func _integrate_forces(state):
#	var displace = $MouseMotionTracker.global_position.x - global_position.x
#
#	state.linear_velocity = Vector2(displace / state.step, 0)






