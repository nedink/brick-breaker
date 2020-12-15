tool
extends Node2D

export (PackedScene) var brick_scene = preload("res://BasicBrick.tscn") setget set_brick_scene
export var rows = 1 setget set_rows
export var columns = 1 setget set_columns
export var size = Vector2(32, 16) setget set_size
export var gutters = Vector2(2, 2) setget set_gutters

func _ready():
	spawn_bricks()

func spawn_bricks():
	for c in get_children():
		remove_child(c)
	if not brick_scene:
		return
	for r in range(rows):
		for c in range(columns):
			# spawn brick
			var brick = brick_scene.instance()
			brick.position.y = r * (size.y + gutters.y)
			brick.position.x = c * (size.x + gutters.x)
			add_child(brick)



func set_brick_scene(val):
	brick_scene = val
	spawn_bricks()

func set_rows(val):
	rows = val
	spawn_bricks()

func set_columns(val):
	columns = val
	spawn_bricks()

func set_size(val):
	size = val
	spawn_bricks()

func set_gutters(val):
	gutters = val
	spawn_bricks()
