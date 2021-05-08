require 'io/console'
class ApplicationWindow
  MIN_WIDTH = 140
  MIN_HEIGHT = 38
  def self.dimensions
    IO.console.winsize
  end

  def self.width
    dimensions[1]
  end

  def self.height
    dimensions[0]
  end

  def self.game_fits_console
    height, width = dimensions
    if height < MIN_HEIGHT || width < MIN_WIDTH
      false
    else
      true
    end
  end

  def self.min_width
    MIN_WIDTH
  end

  def self.min_height
    MIN_HEIGHT
  end
end
