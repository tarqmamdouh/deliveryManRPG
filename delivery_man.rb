# This should be the entry point for the game
# You should really be running the game from this file everytime you want to play it.

require './config/initializers/application'
require 'require_all'
require 'pry'
require 'tty-prompt'
require_all 'app'
require_all 'lib'

GameModules::Main.start