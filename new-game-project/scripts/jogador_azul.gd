extends CharacterBody2D

@onready var forca = 500
@onready var hp = 10

func _physics_process(delta : float) -> void:
	velocity = Input.get_vector("jogador_azul_esquerda","jogador_azul_direita","jogador_azul_cima","jogador_azul_baixo") * forca 
	move_and_slide()
