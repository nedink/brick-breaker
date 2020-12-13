extends Node2D


export (Vector3) var box_extents


func _ready():
	ParticlesMaterial
	for c in get_children():
		if c is Particles2D:
			c.process_material.emission_box_extents = box_extents


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
