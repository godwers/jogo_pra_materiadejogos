extends CharacterBody2D

@onready var forca = 500 
@onready var hp = 10

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("jogador_vermelho_esquerda","jogador_vermelho_direita","jogador_vermelho_cima","jogador_vermelho_baixo") * forca
	move_and_slide()
