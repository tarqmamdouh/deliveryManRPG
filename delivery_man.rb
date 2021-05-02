# This should be the entry point for the game
# You should really be running the game from this file everytime you want to play it.
# I am not that Scriptwriter who competes with God Of War creators,
# just a man who like writing ruby code.
# Enjoy the game ..

require './config/initializers/application'
require 'require_all'
require 'pry'
require_all 'app'
require_all 'lib'

GameModules::Main.start