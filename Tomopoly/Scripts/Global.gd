extends Node2D

# En este script mantengo las variable globales, para llamarlo desde otra escena
#	tengo que hacer Global.blablabla

# Para llamar la nameList desde otro script es solo cosa de poner Global.nameList
var nameList = []

# El path del menu
var prevScene

# Almacena el modo de juego que se esta jugando
var actualGameMode

# Modos de juego
var gameModes = ["Clasico", "..."]

# Pruebas por modo de juego
var pruebasClasico = ["Prueba1", "Prueba2"]



# Pruebas que ya han pasado
var pruebasPasadas = []


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
