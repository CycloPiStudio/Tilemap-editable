extends Node2D

onready var altura = (get_viewport().size.y)
onready var nuevaAltura
export var velocidadSubida = 50

var playerPosX
var playerPosY
var player



func _process(_delta):
	aumentarAltura()
	posicionEnemigo()
	quitarVida()
	
	pass
	

func posicionEnemigo():
	playerPosX = get_node("/root/Principal/Player").get_position().x
	playerPosY = get_node("/root/Principal/Player").get_position().y
	get_node(".").set_position(Vector2(playerPosX, nuevaAltura))


func quitarVida():
	player = get_node("/root/Principal/Player")
	
	if playerPosY > nuevaAltura:
#		get_node("Timer").start()	
#		if 
		player.quitarVida()
#		print ("muere" +str(nuevaAltura))
#		print ("altura player: " + str(playerPosY))
#		print ("altura enemigo: " + str(nuevaAltura ))
		pass


func aumentarAltura():
	var tiempo = int(OS.get_ticks_msec())/velocidadSubida
	nuevaAltura = altura - tiempo
	
#	altura = altura - (int(OS.get_ticks_msec())/1000)
#	print("tiempo: " + str(tiempo))
#	print ("altura: " + str(altura))
#	print ("nueva altura: " + str(nuevaAltura))




