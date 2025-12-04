extends CharacterBody2D
@onready var hp = 3

func _physics_process(delta: float) -> void:
	if get_slide_collision_count() > 0:
		var col = get_slide_collision(0)

		print_debug("gelo debug: ",col.get_collider())
		
		if col.get_collider() != null and col.get_collider().is_in_group("tiros"):
			hp -= 1 

	if hp < 1:
		queue_free()

	move_and_slide()
