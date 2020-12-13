extends Position2D

class_name MouseMotionTracker



func _ready():
#	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	set_as_toplevel(true)

func _process(delta):
	global_position = get_global_mouse_position()
