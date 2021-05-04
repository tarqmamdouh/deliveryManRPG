# Load All needed models in the databse, in case the game is running for the first time
require 'pry'
require 'require_all'
require_all './app/models'
require './lib/loader'

# Intro Arts
Environment.create(name: 'studio_logo', ascii_model: Loader.ascii_model('main_screen/preload_logo.txt'))
Environment.create(name: 'main_screen', ascii_model: Loader.ascii_model('main_screen/main_screen.txt'))
Environment.create(name: 'character_selection_screen', ascii_model: Loader.ascii_model('adventurer/character_selection_screen.txt'))

# About Screen
Environment.create(name: 'about_screen', ascii_model: Loader.ascii_model('about/about_screen.txt'))

# Secret Agent character
Character.create(
    name: 'agent', 
    ascii_model: Loader.ascii_model('adventurer/secret_agent.txt'),
    intelligence: 80,
    hp: 70,
    armor: 40,
    speed: 50
)

# Armored worrior character
Character.create(
    name: 'samurai', 
    ascii_model: Loader.ascii_model('adventurer/samurai.txt'),
    intelligence: 40,
    hp: 90,
    armor: 80,
    speed: 20
)

# assassin character
Character.create(
    name: 'assassin', 
    ascii_model: Loader.ascii_model('adventurer/assassin.txt'),
    intelligence: 70,
    hp: 50,
    armor: 20,
    speed: 90
)
