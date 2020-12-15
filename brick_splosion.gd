extends Node2D


export (Vector3) var box_extents


func _ready():
	ParticlesMaterial
	for c in get_children():
		if c is Particles2D:
			c.process_material.emission_box_extents = box_extents
	var death_timer = Timer.new()
	add_child(death_timer)
	death_timer.wait_time = $Particles2D.lifetime
	death_timer.connect("timeout", self, "queue_free")
	death_timer.start()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
