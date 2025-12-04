extends CharacterBody2D

func _physics_process(delta: float) -> void:
	if get_slide_collision_count() > 0:
		var col = get_slide_collision(0)

		if col.get_collider() != null:
			$ColorRect.color = Color(0,0,0,0)
			await get_tree().create_timer(0.0171).timeout
			queue_free()

	velocity = Vector2(-800,0)
	
	move_and_slide()
