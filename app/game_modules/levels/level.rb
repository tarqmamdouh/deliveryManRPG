# Parent class to initialize levels with core functions
module GameModules
  module Levels
    class Level
      attr_accessor :adventurer

      def initialize
        # Scene of level starting
        @adventurer = Adventurer.new
      end

      # start level
      def start; end
    end
  end
end
