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

# El numero de la ronda
var roundNumber = 0

# Almacena el modo de juego que se esta jugando
var actualGameMode

# Modos de juego
var gameModes = ["Clasico", "Detonado", "Grupos", "1v1"]

# Con esta lista de pruebas se va a jugar
var pruebasIngame = []

# La idea de pruebasPasadas y pruebasPasadasAcumuladas es que pP sea un stack, y cuando aprete volver,
#	se pushea la prueba que se estaba mostrando en pPA y se popea una de pP para mostrar, si apreto volver denuevo
#	se vuelve a pushear a pPa y popear de pP.
# De esta forma cuando aprete siguiente, vamos popeando de pPA hasta que este vacia, y de ahi mostramos nuevas

# Pruebas que ya han pasado
var pruebasPasadas = []

# Pruebas que ya pasaron pero que cuando fui volviendo quiero que se pongan en el mismo orden 
var pruebasPasadasAcumuladas = []

# Esta variable es rara de entender pero:
	# La primera vez que se abre el side menu, hay que cargarle todos los nodos de los nombres a la VBox
	# Como el side menu nunca desaparece realmente, despues ya estan cargados, por lo que no hay que cargarlos
	#	o se duplican
	# Solo hay que cargarlos cuando se llega desde el menu principal
var firstTimeSideMenu = true

# Estas de aqui abajo sirven para elegir el nombre
var rng = RandomNumberGenerator.new()
func _ready():
	rng.randomize()

# Dadas dos listas, retorna un elemento de la primera que no este en la segunda
func chooseName(allNames, usedNames):
	var index = rng.randi_range(0, len(allNames) - 1)
	
	while usedNames.has(allNames[index]):
		index = rng.randi_range(0, len(allNames) - 1)
	
	return allNames[index]


# Pruebas por modo de juego
var pruebasClasico = ["nombre 1: _, nombre 2: _"]


var pruebasDetonado = ["PruebaDetonada"]


var pruebasGrupos = ["PruebaGrupo"]


var pruebas1v1 = ["Prueba1v1"]
