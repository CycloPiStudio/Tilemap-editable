extends Node2D

onready var altura = (get_viewport().size.y)
onready var nuevaAltura
onready var tiempo
export var velocidadSubida = 50

var playerPosX
var playerPosY
var player

func ready():

	pass

func _process(_delta):

	aumentarAltura()
	posicionEnemigo()
#	quitarVida()
#	print (get_node("Timer").get_time_left())


	pass
	

func posicionEnemigo():
	playerPosX = get_node("/root/Principal/Player").get_position().x
	playerPosY = get_node("/root/Principal/Player").get_position().y
	get_node(".").set_position(Vector2(playerPosX, nuevaAltura))


func quitarVida():
	player = get_node("/root/Principal/Player")
	

	if playerPosY > nuevaAltura:
		player.quitarVida()
#		print ("muere a " +str(nuevaAltura) + " metros")	
		pass

	
	

		
#		print (get_node("Timer").get_wait_time())
#		print(get_node("Timer").start())
#		print(get_node("Timer").stop())
#		if get_node("Timer").start() == true:
#			print("corriendo")
#		if get_node("Timer").stop() == true:
#			print("parado")
		
#		print ("altura player: " + str(playerPosY))
#		print ("altura enemigo: " + str(nuevaAltura ))
		pass


func aumentarAltura():
	tiempo = int(OS.get_ticks_msec())/velocidadSubida
	nuevaAltura = altura - tiempo
	
#	altura = altura - (int(OS.get_ticks_msec())/1000)
#	print("tiempo: " + str(tiempo))
#	print ("altura: " + str(altura))
#	print ("nueva altura: " + str(nuevaAltura))






