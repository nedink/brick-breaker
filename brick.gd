tool
extends StaticBody2D

class_name Brick

export var hp = 1 setget set_hp

var brick_splosion_scene = preload("res://BrickSplosion.tscn")


func _ready():
#	var offsets = []
#	for i in range(4):
#		offsets.append(Vector2(randf(), randf()))
#
#	var poly = $CollisionPolygon2D.polygon
#	for i in range(4):
#		poly[i] += offsets[i]
#
#	$CollisionPolygon2D.polygon = poly
#	$Polygon2D.polygon = poly
	pass






func damage(amt:float) -> void:
	set_hp(hp - amt)
	if hp <= 0:
		# explosion
		var brick_splosion = brick_splosion_scene.instance()
		brick_splosion.position = position
		get_tree().root.get_node("Main").add_child(brick_splosion)
		queue_free()


func set_hp(amt:float):
	hp = amt
	# set color according to hp
	if has_node("Panel"):
		if hp == 1:
			$Panel.self_modulate = Color.white
		if hp == 2:
			$Panel.self_modulate = Color.green
		if hp == 3:
			$Panel.self_modulate = Color.blue
		if hp == 4:
			$Panel.self_modulate = Color.purple
		if hp == 5:
			$Panel.self_modulate = Color.orange
		if hp == 6:
			$Panel.self_modulate = Color.red
