# Animate and move the ascii model in console window
class Animation
  def self.apply(ascii_model, name, direction, speed)
    # get the class of a given style
    animation = Object.const_get(name.capitalize)
    animation.apply(ascii_model, direction, speed)
  end
end