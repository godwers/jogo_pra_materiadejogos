extends CharacterBody2D

@onready var forca = 300 
@onready var hp = 5
@onready var prefabs_tiro = preload("res://prefabs/jogador_vermelho/tiro_vermelho.tscn")
@onready var prefabs_gelo = preload("res://prefabs/gelo/gelo.tscn")
@onready var uso_gelos = 3

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("jogador_vermelho_esquerda","jogador_vermelho_direita","jogador_vermelho_cima","jogador_vermelho_baixo") * forca

	if Input.is_action_pressed("jogador_vermelho_atirar") and $Timer.is_stopped():
		
		print_debug("jogador vermelho atirou")
		var tiro = prefabs_tiro.instantiate()
		get_tree().get_root().add_child(tiro)
		tiro.position = Vector2(position.x - 25,position.y)
		$Timer.start()

	if Input.is_action_pressed("jogador_vermelho_construir") and $Timergelo.is_stopped() and uso_gelos > 0:
		print_debug("jogador vermelho gelou")
		var gelo = prefabs_gelo.instantiate()
		get_tree().get_root().add_child(gelo)
		gelo.position = Vector2(position.x - 50,position.y)
		$Timergelo.start()
		uso_gelos -= 1

	move_and_slide()
