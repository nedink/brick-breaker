extends StaticBody2D

class_name Brick

export var hp = 1



func _ready():
	var offsets = []
	for i in range(4):
		offsets.append(Vector2(randf(), randf()))
	
	var poly = $CollisionPolygon2D.polygon
	for i in range(4):
		poly[i] += offsets[i]
	
	$CollisionPolygon2D.polygon = poly
	$Polygon2D.polygon = poly




func damage(amt:float) -> void:
	hp -= amt
	if hp <= 0:
		queue_free()
