# Class to play a scene on the starting & along levels
class Scene
  # play scene given from the database
  # name: (STRING) Name of the scene in the game database
  # duration: (Integer) Time duration to run the scene (with Seconds)
  # (optional) animation: (Hash) options with the following structure:-
  #   {
  #       name: (STRING) Animation name
  #       direction: (STRING) direction of the animation
  #      delay: (FLOAT) Delay between each frame and other the lower the fastest, min value 0.05
  #               Otherwise flickering will happen
  #   }
  # (optional) args (HASH) contains name/value of varible to replace in ascii model
  def self.play(name, duration = 60, animation = {}, args = {})
    if !args.empty?
      DrawingEngine.draw_with_text(
        Loader.db_ascii_model(Environment, name),
        args
      )
    elsif animation[:name].nil?
      DrawingEngine.draw(
        Loader.db_ascii_model(Environment, name)
      )
    else
      DrawingEngine.draw_with_animation(
        Loader.db_ascii_model(Environment, name),
        animation[:name] || 'Fadein',
        animation[:direction] || 'top',
        animation[:delay] || 0.05
      )
    end

    # check if it's static scene
    if animation[:static]
      GameMenu.keypress(duration)
    else
      sleep(duration)
    end
  end
end
