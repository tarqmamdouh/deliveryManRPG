# Load All needed models in the databse, in case the game is running for the first time
require 'pry'
require 'require_all'
require_all './app/models'
require './lib/loader'

# Intro Arts
Environment.create(name: 'studio_logo', ascii_model: Loader.ascii_model('preload_logo.txt'))
