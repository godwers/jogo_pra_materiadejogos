extends Node2D

@onready var jogador_azul_prefab = preload("res://prefabs/jogador_azul/jogador_azul.tscn")
@onready var jogador_vermelho_prefab = preload("res://prefabs/jogador_vermelho/jogador_vermelho.tscn")

func _ready() -> void:
	# Spawna o jogador azul
	var jogador_azul = jogador_azul_prefab.instantiate()
	jogador_azul.position = $JogadorAzulSpawn.position 
	get_tree().current_scene.add_child(jogador_azul)
	# Spawna o jogador vermelho
	var jogador_vermelho = jogador_vermelho_prefab.instantiate()
	jogador_vermelho.position = $JogadorVermelhoSpawn.position 
	get_tree().current_scene.add_child(jogador_vermelho)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
