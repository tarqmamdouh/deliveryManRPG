# helper class to style the showing ascii model by applying some css style
# currently this helper is limited to the following options:-
# margin (top - left - right - bottom)
# alignment (center - top - left -right)
# e.g Style.apply({
#  margin: {
#   left: 20,
#   top: 10
# }
#  alignment: 'left'
#})
require 'require_all'
# require_all './lib/styling_utils'
class Style
    def self.apply(ascii_model, styles = {})
      styles.each do |k, style|
        # get the class of a given style
        style_object = Object.const_get(k.to_s.capitalize)
        
        # check if the value is a hash
        if style.is_a?(Hash)
          style.each do |direction, step|
            style_object.apply(ascii_model, direction, step)
          end
        else
          style_object.apply(ascii_model, style.to_s)
        end
      end
      ascii_model
    end
end