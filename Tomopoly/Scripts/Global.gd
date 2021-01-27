extends Node2D


# En este script mantengo las variable globales, para llamarlo desde otra escena
#	tengo que hacer Global.blablabla

# Esta variable guarda la cantidad de jugadores que se TRATAN de agregar,
#	me sirve para validar que no se traten de agregar mas de 16
#	Para obtener la cantidad de jugadores real, es el len de nameList
var playerNumber = 1

# Para llamar la nameList desde otro script es solo cosa de poner Global.nameList
var nameList = []

# El path del menu
var prevScene


# Almacena el modo de juego que se esta jugando
var actualGameMode

# Modos de juego
var gameModes = ["Clasico", "Detonado", "Grupos", "1v1"]

# Con esta lista de pruebas se va a jugar
var pruebasIngame = []

# Pruebas que ya han pasado, escritas segun el indice de la lista de arriba
var pruebasPasadas = []

# Esta variable es rara de entender pero:
	# La primera vez que se abre el side menu, hay que cargarle todos los nodos de los nombres a la VBox
	# Como el side menu nunca desaparece realmente, despues ya estan cargados, por lo que no hay que cargarlos
	#	o se duplican
	# Solo hay que cargarlos cuando se llega desde el menu principal
var firstTimeSideMenu = true




# Pruebas por modo de juego
var pruebasClasico = ["PruebaClasica"]


var pruebasDetonado = ["PruebaDetonada"]


var pruebasGrupos = ["PruebaGrupo"]


var pruebas1v1 = ["Prueba1v1"]
