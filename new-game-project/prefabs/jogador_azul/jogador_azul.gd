extends CharacterBody2D

@onready var prefabs_tiro = preload("res://prefabs/jogador_azul/tiro_azul.tscn")
@onready var prefabs_gelo = preload("res://prefabs/gelo/gelo.tscn")
@onready var prefabs_israel = preload("res://missel.tscn")

@onready var hp = 5
@onready var uso_gelos = 3
@onready var forca = 300
@onready var uso_missel = 2
	

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("jogador_azul_esquerda","jogador_azul_direita","jogador_azul_cima","jogador_azul_baixo") * forca 

	if Input.is_action_pressed("jogador_azul_atirar") and $Timer.is_stopped():
		 
		print_debug("jogador azul atirou")
		var tiro = prefabs_tiro.instantiate()
		get_tree().get_root().add_child(tiro)
		tiro.position = Vector2(position.x + 25,position.y)
		$Timer.start()

	if Input.is_action_pressed("jogador_azul_construir") and $Timergelo.is_stopped() and uso_gelos > 0:
		print_debug("jogador azul gelou")
		var gelo = prefabs_gelo.instantiate()
		get_tree().get_root().add_child(gelo)
		gelo.position = Vector2(position.x + 50,position.y)
		$Timergelo.start()
		uso_gelos -= 1
		
	if Input.is_action_pressed("jogador_azul_missel") and $TimerIsrael.is_stopped() and uso_missel > 0:
		var missel = prefabs_israel.instantiate()
		get_tree().get_root().add_child(missel)
		missel.position = Vector2(position.x + 50,position.y)
		$TimerIsreal.start()
		uso_missel -= 1
		
	if get_slide_collision_count() > 0:
		var col = get_slide_collision(0)
		
		if col.get_collider() != null and col.get_collider().is_in_group("tiros"):
			hp -= 1
			
	if hp < 1:
		queue_free()
		
	move_and_slide()
