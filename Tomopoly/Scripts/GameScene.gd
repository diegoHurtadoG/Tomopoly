extends Node2D

onready var label = get_node("textoPruebas")

# En este script lo que tiene que pasar es que al apretar siguiente se haga:
#	Se mapea el actualGameMode con los posibles modos de juego
#	Se cambia el label.text a alguna prueba aleatoria de la lista de pruebas de ese modo


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# Al apretar el boton "Siguiente"
func _on_Button_pressed():
	if Global.actualGameMode == Global.gameModes[0]: #Entra si esta en modo clasico
		# Esta parte deberia ser aleatoria pero esto es para testeo
		label.text = Global.pruebasClasico[0]
