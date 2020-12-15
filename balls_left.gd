extends Position2D

export var balls_left = 1



func _process(delta):
	update()


func _draw():
	for b in balls_left:
		draw_rect(Rect2(b * 16, 16, 4, 4), Color.white, true, 0)
		
