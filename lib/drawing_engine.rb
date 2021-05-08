# Class intended to draw the specified ascii models
require 'io/console'

class DrawingEngine
  
  def self.game_layout
    system("clear")
    horizental_line
    line_break(2)
    yield
    line_break(2)
    horizental_line
  end

  def self.draw(ascii_model)
    game_layout do
      puts ascii_model
    end
  end

  def self.draw_with_styles(ascii_model, styles={})
    game_layout do
      drawing_lines = ascii_model.split("\n")
      drawing_lines = Style.apply(drawing_lines, styles)
      puts drawing_lines
    end
  end

  # Uses draw with styles but with sequence
  # ascii_model (STRING) contains ascii_art
  # name (STRING) animation name
  # name (STRING) animation direction top - bottom - left - right
  #delay (INTEGER) Drawing delay between frames higher slower
  def self.draw_with_animation(ascii_model, name, direction,delay=0.05)
    Animation.apply(ascii_model, name, direction,delay)
  end

  # Draw the model with variables, replace them with given inputs
  # ascii_model (STRING) contains ascii_art
  # args (HASH) contains the arguments in the text to replace
  def self.draw_with_text(ascii_model, args)
    game_layout do
      args.each {|name, val| ascii_model[name.to_s] = val unless ascii_model[name.to_s].nil?}
      puts ascii_model
    end
  end

  def self.line_break(number = 1)
    puts ["\n" * number]
  end

  def self.horizental_line
    _ , width = IO.console.winsize
    puts ["=" * width]
  end
end