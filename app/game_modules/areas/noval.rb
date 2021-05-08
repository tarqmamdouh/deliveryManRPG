module GameModules
  module Areas
    class Noval < LevelArea
      def start
        Scene.play('lvl01_17', 60, { static: true })
        Scene.play('credits', 60, {
                     name: 'Fadein',
                     direction: 'bottom',
                     static: true
                   })
        GameModules::Main.start
      end
    end
  end
end
