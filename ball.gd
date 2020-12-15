extends RigidBody2D

class_name Ball


export var damage = 1
export var speed = 300




func _integrate_forces(state):
#	if state.linear_velocity.angle() in range(0, PI/16):
#		state.linear_velocity = Vector2.RIGHT * state.linear_velocity.length()
	if state.linear_velocity.length() > 10:
		state.linear_velocity = state.linear_velocity.normalized() * speed




func _on_Ball_body_entered(body):
	$Label.text = str(body)
	if body.has_method("damage"):
		body.damage(damage)
		
