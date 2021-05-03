# Class intended to display game menu with options.
# The menu depends on tty-prompt read documentation 
# https://github.com/piotrmurach/tty-prompt
require 'tty-prompt'

# There is multiple representation for the menu
# 1 - GameMenu.select => Select menu that allows user to select using arrows
#     * Takes Message to the selection
#     * Takes selections as hash structured as follows
#           { "Choice Name" : Callback, .... }
class GameMenu
  # Prompt to the console
  PROMPT = TTY::Prompt.new

  def self.select(message, choices)
    loop do
      response = PROMPT.select(message, choices.keys, active_color: :cyan) 
      choices.each do |choice, callback|
        if response == choice
          callback.call
          return
        end
      end
    end
  end
end