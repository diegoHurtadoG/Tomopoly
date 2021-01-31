extends Node2D

#Scripts de la escena de eleccion de modos de juego, contiene las señales 
#	de lo que pasa cada vez que se apreta el boton diferente.

# Lo que deberia hacer cada funcion es cambiar el valor de actualGameMode (para poder ocuparla validacion despues)
#	y cambiar a la escena gamescene (todas)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Clasico_pressed():
	Global.actualGameMode = Global.gameModes[0]
	
	# Esto lo pongo para que si vuelvo al menu no se acumulen
	Global.pruebasIngame = []
	Global.pruebasPasadas = []
	Global.pruebasPasadasAcumuladas = []
	
	Global.pruebasIngame += Global.pruebasClasico
	Global.pruebasIngame.shuffle()
	get_tree().change_scene("res://Scenes/GameScene.tscn")


func _on_Detonado_pressed():
	Global.actualGameMode = Global.gameModes[1]
	
	# Esto lo pongo para que si vuelvo al menu no se acumulen
	Global.pruebasIngame = []
	Global.pruebasPasadas = []
	Global.pruebasPasadasAcumuladas = []
	
	Global.pruebasIngame += Global.pruebasDetonado
	Global.pruebasIngame.shuffle()
	get_tree().change_scene("res://Scenes/GameScene.tscn")


func _on_Grupos_pressed():
	Global.actualGameMode = Global.gameModes[2]
	
	# Esto lo pongo para que si vuelvo al menu no se acumulen
	Global.pruebasIngame = []
	Global.pruebasPasadas = []
	Global.pruebasPasadasAcumuladas = []
	
	Global.pruebasIngame += Global.pruebasGrupos
	Global.pruebasIngame.shuffle()
	get_tree().change_scene("res://Scenes/GameScene.tscn")


func _on_1_v_1_pressed():
	Global.actualGameMode = Global.gameModes[3]
	
	# Esto lo pongo para que si vuelvo al menu no se acumulen
	Global.pruebasIngame = []
	Global.pruebasPasadas = []
	Global.pruebasPasadasAcumuladas = []
	
	Global.pruebasIngame += Global.pruebas1v1
	Global.pruebasIngame.shuffle()
	get_tree().change_scene("res://Scenes/GameScene.tscn")
