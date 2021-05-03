require 'io/console'
class ApplicationWindow
    MIN_WIDTH = 130
    MIN_HEIGHT = 42
    def self.dimensions
        IO.console.winsize
    end

    def self.width
        dimensions()[1]
    end

    def self.height
        dimensions()[0]
    end

    def self.game_fits_console
        height, width = dimensions
        if (height < MIN_HEIGHT || width > MIN_WIDTH) 
            false
        else
            true
        end
    end
end