# This should be the entry point for the game
# You should really be running the game from this file everytime you want to play it.

require './config/initializers/application'
require 'require_all'
require 'pry'
require 'tty-prompt'
require_all 'app'
require_all 'lib'

# Validate the game can run in your console
loop do
    if ApplicationWindow.game_fits_console
        break
    else
        system("clear")
        puts "your console size is not enough to run the game, 
              please increase it...\n
              current: #{ApplicationWindow.width} X #{ApplicationWindow.height} \n
              Required: #{ApplicationWindow.min_width} X #{ApplicationWindow.min_height} \n
              CTRL + C to Exit"
        sleep(0.5)
    end
end
GameModules::Main.start