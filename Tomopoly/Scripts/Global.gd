extends Node2D

func _ready():
	randomize()

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

# Dadas dos listas, retorna un elemento de la primera que no este en la segunda
func chooseName(allNames, usedNames):
	var index = rng.randi_range(0, len(allNames) - 1)
	if len(usedNames) == len(allNames): # Para que no se haga un loop infinito
		return allNames[0]
	while usedNames.has(allNames[index]):
		index = rng.randi_range(0, len(allNames) - 1)
	
	return allNames[index]

# Dada una lista de pruebas, le suma tragos a cada numero que aparezca
func addSips(lista):
	var listaAux = []
	for element in lista:
		for i in element:
			if isDigit(i):
				var pos = element.find(i)
				element[pos] = str(int(i) + 3)
		listaAux.append(element)
	return listaAux

# Dado un char, verifica que este sea un digito
var digitList = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
func isDigit(param):
	if param in digitList:
		return true
	return false

# Pruebas por modo de juego
var pruebasClasico = [
"Prefieres cortarte un mano o un pie, voten todos juntos, la minoría bebe 2 tragos",
"Hasta el fondo para _",
"_, lee en voz alta el último mensaje que recibiste",
"_, cómo le gustan las mujeres (los hombres) a _, rubias, morenas o coloras",
"_, cuántas comunas hay en Chile",
"_, con quién pasarías 1 mes en una isla desierta? Aquella persona deberá regalar 2 tragos",
"Todo aquel que hable en lenguaje inclusive bebe 3 tragues",
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
"Cultura chupistica pide {tema}, _ empieza",
"Cultura chupistica pide {tema}, _ empieza",
"Cultura chupistica pide {tema}, _ empieza",
"Cultura chupistica pide {tema}, _ empieza",
"Cultura chupistica pide {tema}, _ empieza",
"Elegir entre {eleccion}, la minoria toma 3",
"Elegir entre {eleccion}, la minoria toma 3",
"Elegir entre {eleccion}, la minoria toma 3",
"Elegir entre {eleccion}, la minoria toma 3",
"Elegir entre {eleccion}, la minoria toma 3",
"_ pon una regla, puedes elegir entre las sugeridas",
"_ pon una regla, puedes elegir entre las sugeridas",
"_ pon una regla, puedes elegir entre las sugeridas",
"_ pon una regla, puedes elegir entre las sugeridas",
"_ pon una regla, puedes elegir entre las sugeridas",
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
"Toma por cada vocal que tenga tu nombre",
"La persona mas baja toma 2",
"_ termina tu vaso antes de que _ de 10 vueltas sobre si mismo, si lo logras elije a alguien que lo termine contigo",
"Todos los que se hayan mirado al espejo hoydia y se hayan reido por su cara toman 3",
"Si haz llamado a tu ex borracho, toma 5, pero no lo hagas denuevo",
"Si haz recibido un piropo en la calle, toma 3 y regala 3",
"La persona a la izquierda de _, toma 3, la de la derecha regala 2",
"Reparte 2 tragos si te haz operado alguna vez",
"Toma 3 si tuviste frenillos",
"_, canta un estribillo de Bad Bunny o bebe 3 tragos",
"Elegir entre todos a la persona mas inteligente, esta toma 4",
"_ recita el abecedario al revez, toma 4 si te equivocas",
"Los que no fuman regalan 3 tragos cada uno",
"_ y _ deberan mirarse fijamente a los ojos, el primero en pestañear debera beber 4 tragos",
"_ si la ultima vez que hiciste pipi fue en un baño, regala 3 tragos, sino, tomalos",
"_ toma 4 tragos, el de la izquierda uno menos y asi sucesivamente hasta llegar a 0",
"La persona mas guapa toma 3 tragos",
"Si no sabes bailar Cueca, toma 3 tragos",
"_ si tu vaso esta bajo la mitad, terminalo",
"_ si alguna vez haz mentido sobre tu edad, toma 4",
"Los que no tengan descargado Tomopoly, beben 3, los que si, regalan 3",
"Toman los estudiantes/egresados del area de la salud",
"Toman los estudiantes/egresados de ingenieria",
"_ toma tantos tragos como jugadores haya",
"_ reparta tantos tragos como solteros jugando",
"Los que sean mas bajos que _ toman 3",
"Los que sean mas altos que _ toman 4",
"_ di algo que nunca hayas hecho, los que lo hayan hecho toman 3",
"Todos apunten a una persona, cada uno toma la cantidad de veces que te apuntaron",
"Hombres toman la cantidad de mujeres que hayan",
"Mujeres toman la cantidad de hombres que hayan",
"La persona que este poniendo musica regala 4 por jugarsela",
"El host del juego regala 4 por jugarsela",
"El/Los ultimo(s) que haya llegado termina el vaso",
"La primera persona que encuentre un objeto blanco reparte 3 tragos",
"_ toma 2 tragos sin las manos, si lo logras, la persona a tu derecha toma 4",
"_ con que jugador te quedarias en una isla desierta? Si no quieres responder bebe 3",
"Todos los que tengan tinder beben 3, y de pasada hablenle a algun match",
"Si no han pasado las 20:00, todos toman 3",
"_ en cualquier momento del juego puedes gritar BOMBA, el ultimo jugador en tirarse al suelo bebe 3"
]



var pruebasDetonado = [
"_ deberá hacer un cara pálida de mínimo 3 segundos" ,
"_ deberá chuparle el nipple (pezón) a la persona que _ elija",
"_ deberá hacer un chilly willy con una tapa de pisco",
"El jugador con el vaso más lleno deberá tomarse la mitad de este",
"_ deberá chuparle la oreja por 3 seg a _",
"Todos terminan el vaso",
"_ recita el abecedario al revez, toma 3 por cada error que cometas",
"Elegir entre todos a la persona más loca, este debe hacer un trompetazo de 4 segundos en posición invertida",
"_, tapita",
"Todos toman tapita",
"_ sirvele un vaso a _, pero primero lo tiene que terminar",
"_, chilly willy",
"_, haz un snorkel",
"_, termina el vaso"
]


var pruebasGrupos = ["PruebaGrupo"]


var pruebas1v1 = ["Prueba1v1"]

var eleccion =  [
"Pizza o Hamburguesa",
"Melvin o Kevin",
"Disco o carrete en casa",
"1 mes sin netflix o 1 mes sin Youtube",
"Ser vegano por 1 mes o no tomar pisco por 3 meses",
"Tener la habilidad de leer mentes o la habilidad de ver el futuro",
"Ser la persona mas inteligente o ser la mas sexy",
"Cara o sello",
"McDonalds o Burger king"
]

var temasCulturaChupistica =  [
"Presidentes de Chile",
"Estados de USA",
"Canciones de Bad Bunny",
"Personajes de Toy Story",
"Signos zodiacales",
"Planetas del Sistema Solar",
"Excusas para terminar de bailar en la disco",
"Nombres con los que puedes llamar al aparato reproductor masculino",
"Nombres con los que puedes llamar al aparato reproductor femenino",
"Clubes de fútbol chilenos",
"Excusas para llegar tarde al trabajo",
"Canciones de Chayanne",
"Comunas de Santiago",
"Cosas que traen mala suerte",
"Paises de africa",
"Actores de peliculas de comedia",
"Cantantes latinos",
"Locales de comida rapida",
"Cosas para tomar cuando uno esta resfriado",
"Equipos de la NBA"
]
