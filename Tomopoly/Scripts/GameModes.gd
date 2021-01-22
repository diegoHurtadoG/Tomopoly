extends Node2D

#Scripts de la escena de eleccion de modos de juego, contiene las señales 
#	de lo que pasa cada vez que se apreta el boton diferente.

# Lo que deberia hacer cada funcion es cambiar el valor de actualGameMode (para poder ocuparla validacion despues)
#	y cambiar a la escena gamescene (todas)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Clasico_pressed():
	Global.actualGameMode = Global.gameModes[0]
	get_tree().change_scene("res://Scenes/GameScene.tscn")
