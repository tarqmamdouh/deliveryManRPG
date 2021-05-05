# Class to play a scene on the starting & along levels
class Scene
    # play scene given from the database
    # name: (STRING) Name of the scene in the game database
    # duration: (Integer) Time duration to run the scene (with Seconds)
    # (optional) animation: (Hash) options with the following structure:-
    #   {
    #       name: (STRING) Animation name
    #       direction: (STRING) direction of the animation
    #       speed: (FLOAT) Delay between each frame and other the lower the fastest, min value 0.05
    #               Otherwise flickering will happen 
    #   }
    def self.play(name, duration=60, animation={})
        if animation.empty?
            DrawingEngine.draw(
                Loader.db_ascii_model(Environment, name)
            )
        else
            DrawingEngine.draw_with_animation(
                Loader.db_ascii_model(Environment, name),
                animation[:name] || 'Fadein',
                animation[:direction] || 'top',
                animation[:speed] || 0.05
            )
        end

        # check if it's story scene
        if animation[:story]
            GameMenu.keypress(duration)
        else
            sleep(duration)
        end
    end
end
