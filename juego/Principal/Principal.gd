extends Control

# Declare member variables here. Examples:
# var a = 2
onready var tilemap : TileMap 
onready var tileset : TileSet = preload("res://juego/tileset/tileset-escenario.tres")
onready var personaje : KinematicBody2D = preload("res://juego/personaje/Player_01.tscn").instance()
#= $TileMap
# Called when the node enters the scene tree for the first time.
func _ready():
	tilemap = TileMap.new ()
	tilemap.MODE_SQUARE
#	tilemap.cell_size
	tilemap.set_cell_size(Vector2(32,32)) 
	
#	tileset = TileSet.new()
	tilemap.set_tileset(tileset) 
	get_node("/root/Principal").add_child(tilemap)

	for i in 20:
		tilemap.set_cell(i, 5, 1)
	
	get_node("/root/Principal").add_child(personaje)

func _input(event):
	var lado = 32
	if personaje.get_node("AnimatedSprite").flip_h:
		lado = -32
	else:
		lado = 32
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
#		var mouse_pos = get_viewport().get_mouse_position()
		var personaje_pos = Vector2(personaje.get_position().x + lado, personaje.get_position().y)
		
		var tile_pos = tilemap.world_to_map(personaje_pos)
		tilemap.set_cell(tile_pos.x,tile_pos.y, 1)
		#print(tile_pos)
	if event is InputEventMouseButton and event.button_index == BUTTON_RIGHT:
#		var mouse_pos = get_viewport().get_mouse_position()
		var personaje_pos = Vector2(personaje.get_position().x + lado ,personaje.get_position().y)
		var tile_pos = tilemap.world_to_map(personaje_pos)
		tilemap.set_cell(tile_pos.x,tile_pos.y, -1)
#		print(tile_pos)
