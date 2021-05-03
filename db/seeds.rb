# Load All needed models in the databse, in case the game is running for the first time
require 'pry'
require 'require_all'
require_all './app/models'
require './lib/loader'

# Intro Arts
Environment.create(name: 'studio_logo', ascii_model: Loader.ascii_model('main_screen/preload_logo.txt'))
Environment.create(name: 'main_screen', ascii_model: Loader.ascii_model('main_screen/main_screen.txt'))

# About Screen
Environment.create(name: 'about_screen', ascii_model: Loader.ascii_model('about/about_screen.txt'))