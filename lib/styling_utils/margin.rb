# Class to addd margin space to move the model in specific direction
# console dimensions is  117 X 44
# Inner window is 117 X 19
class Margin
  def self.apply(ascii_model, direction, value)
    case direction.to_s
    when "top"
      top(ascii_model, value)
    when "bottom"
      bottom(ascii_model, value)
    when "left"
      left(ascii_model, value)
    when "right"
      right(ascii_model, value)
    else
      WARN "Error: invalid direction (#{direction})"
    end
  end

  def self.top(ascii_model, value)
    (1..value).each do |step|
      # push empty line at the beginning
      ascii_model.unshift([" " * 117])

      # remove last line from the model (cut-off)
      ascii_model.pop
    end
  end

  def self.left(ascii_model, value)
    (1..value).each do |step|
      ascii_model.each do |line|
        # append empty character to the start of the line
        line.insert(0, " ")

        # remove last element from the model (cut-off)
        line.chop!
      end
    end
  end

  def self.right(ascii_model, value)
    (1..value).each do |step|
      ascii_model.each do |line|
        # append empty character to the end of the line
        line << " "
        
        # remove first element from the model (cut-off)
        line[0] = ""
      end
    end
  end

  def self.bottom(ascii_model, value)
    (1..value).each do |step|
      # push empty line
      ascii_model << [" " * 117]
      
      # remove existing line
      ascii_model.shift
    end
  end
end