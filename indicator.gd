extends Position2D

class_name Indicator




func _process(delta):
	look_at(get_global_mouse_position())
