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
      drawing_lines = ascii_model.split("\n")
      drawing_lines.each do |line|
        puts line
      end
    end
  end

  def self.draw_with_styles(ascii_model, styles={})
    game_layout do
      drawing_lines = ascii_model.split("\n")
      drawing_lines = Style.apply(drawing_lines, styles)
      drawing_lines.each do |line|
        puts line
      end
    end
  end

  # Uses draw with styles but with sequence
  def self.draw_with_animation(ascii_model, name, direction, speed=0.05)
    Animation.apply(ascii_model, name, direction, speed)
  end

  def self.line_break(number = 1)
    puts ["\n" * number]
  end

  def self.horizental_line
    _ , width = IO.console.winsize
    puts ["=" * width]
  end
end