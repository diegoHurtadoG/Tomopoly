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
	if len(usedNames) == len(allNames): # Para que no se haga un loop infinito
		return allNames[0]
	while usedNames.has(allNames[index]):
		index = rng.randi_range(0, len(allNames) - 1)
	
	return allNames[index]


# Pruebas por modo de juego
var pruebasClasico = [
"Prefieres cortarte un mano o un pie, voten todos juntos, la minoria bebe 2 trago",
"Hasta el fondo para _",
"Cultura chupistica pide {tema}, _ empieza",
"_, lee en voz alta el último mensaje que recibiste",
"_, como le gustan las mujeres (los hombres) a _, rubias, morenas o coloras",
"_, cuantas comunas hay en Chile",
"_, con quién pasarías 1 mes en una isla desierta? Aquella persona deberá regalar 2 tragos",
"Todo aquel que hable en lenguaje inclusive bebe 3 tragues",
"{tema de esto o esto}",
"Toma 2 tragos por cada ramo que hayas reprobado",
"Todos los que esten usando calcetines negros toman 2",
"Todos los que usan anteojos toman 2",
"Todos los que hayan tenido COVID la matan",
"Todos los que tuvieron un amigo invisible cuando chicos toman 2",
"Todos los que fueron suspendidos alguna vez en el colegio toman 2",
"Todos los que hayan repetido la prueba para sacar la licencia de conducir toman 2",
"_, cuándo fue la última vez que _ apagó tele?",
"Los que nunca han pololeado regalan 2",
"Todos los que compitieron alguna vez (en cualquier tipo de competencia) por su colegio regalan 2",
"Todos los que hayan ganado alguna vez un concurso toman 2",
"Tomar 1 trago por cada tatuaje que tengas",
"Regalar 2 tragos las personas con ojos azules",
"Todas las personas con más de 750 seguidores en Instagram toman 3",
"Todos los que sigan a Tomopoly en Instagram regalan 3 tragos",
"Todos los que se hayan lanzado alguna vez en paracaídas regalan 2",
"Todos los que se hayan lanzado alguna vez en bungee regalan 2",
"Si alguna vez ahogaste en la piscina a tus Sims toma 3",
"Todos los que estén jugando sin tomar regalan 2",
"La última persona que se haya servido un vaso, se toma la mitad de este",
"La última persona que fue al baño toma 3",
"Si vives con tus padres toma 2",
"Si no te duchaste hoy toma 3 sucio de mierda",
"_, toma 3 tragos",
"_, regala 2 tragos",
"_, qué tipo de película prefiere _? 3 tragos en juego",
"Regala 1 trago por cada mascota que tengas",
"Si usas reloj toma 2",
"Juego del 7",
"El/La dueño/a de casa regala 3",
"Toda persona con el celular en mano toma 3 (excepto el que lee el juego)",
"Toma por cada vocal que tenga tu nombre"
]



var pruebasDetonado = ["PruebaDetonada"]


var pruebasGrupos = ["PruebaGrupo"]


var pruebas1v1 = ["Prueba1v1"]
