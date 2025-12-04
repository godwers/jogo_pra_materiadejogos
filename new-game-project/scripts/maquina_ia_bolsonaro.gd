extends CharacterBody2D
@onready var hp = 10
func _physics_process(delta: float) -> void:
	if get_slide_collision_count() > 0:
		var col = get_slide_collision(0)

		if col.get_collider() != null and col.get_collider().is_in_group("tiros"):
			print_debug(col)
			hp -= 1 
		
	if hp < 1:
		queue_free()
		get_tree().change_scene_to_file("res://ganha_jogador_vermelho.tscn")
	velocity = Vector2.ZERO

	move_and_slide()
