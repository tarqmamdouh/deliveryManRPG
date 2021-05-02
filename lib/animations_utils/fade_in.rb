# Fade in animation for 
class Fadein
  HORIZENTAL_STEPS = 100
  VERTICAL_STEPS = 14

  def self.apply(ascii_model, direction, speed)
    case direction
    when "top"
      top(ascii_model, speed)
    when "bottom"
      bottom(ascii_model, speed)
    when "left"
      left(ascii_model, speed)
    when "right"
      right(ascii_model, speed)
    else
      WARN "Error: invalid direction (#{direction})"
    end
  end

  def self.top(ascii_model, speed)
    # Initiate model outside container
    initial_model = ascii_model
    initial_position(ascii_model, "top")
    sleep(speed)
    
    # animate model by re-render each step
    (1..VERTICAL_STEPS).each do |step|
      DrawingEngine.draw_with_styles(ascii_model, {
        margin: {
          bottom: VERTICAL_STEPS - step
        }
      })
      sleep(speed)
    end
  end

  def self.left(ascii_model, speed)
    # Initiate model outside container
    initial_position(ascii_model, "left")
    sleep(speed)
        
    # animate model by re-render each step
    (1..HORIZENTAL_STEPS).each do |step|
      DrawingEngine.draw_with_styles(ascii_model, {
        margin: {
          right: HORIZENTAL_STEPS - step
        }
      })
      sleep(speed)
    end
  end

  def self.right(ascii_model, speed)
    # Initiate model outside container
    initial_position(ascii_model, "right")
    sleep(speed)
        
    # animate model by re-render each step
    (1..HORIZENTAL_STEPS).each do |step|
      DrawingEngine.draw_with_styles(ascii_model, {
        margin: {
          left: HORIZENTAL_STEPS - step
        }
      })
      sleep(speed)
    end
  end

  def self.bottom(ascii_model, speed)
    # Initiate model outside container
    initial_position(ascii_model, "bottom")
    sleep(speed)
        
    # animate model by re-render each step
    (1..VERTICAL_STEPS).each do |step|
      DrawingEngine.draw_with_styles(ascii_model, {
        margin: {
          top: VERTICAL_STEPS - step
        }
      })
      sleep(speed)
    end
  end

  # use this method to initialize the position of the model outside the window
  # expected positions: 'left', 'top', 'right', 'bottom'
  def self.initial_position(ascii_model, position)
    case position
    when "top"
      DrawingEngine.draw_with_styles(ascii_model, {
        margin: {
          bottom: VERTICAL_STEPS
        }
      })
    when "bottom"
      DrawingEngine.draw_with_styles(ascii_model, {
        margin: {
          top: VERTICAL_STEPS
        }
      })
    when "left"
      DrawingEngine.draw_with_styles(ascii_model, {
        margin: {
          right: HORIZENTAL_STEPS
        }
      })
    when "right"
      DrawingEngine.draw_with_styles(ascii_model, {
        margin: {
          left: HORIZENTAL_STEPS
        }
      })
    else
      WARN "Error: invalid positon (#{direction})"
    end
  end
end