class Monster < ActiveRecord::Base
    def ascii_art
        result = drawing_lines
        result << [" " * 120]
        result << { 
            hp: self.hp, 
            armor: self.armor,
            damage: self.damage
        }.map {|k, v| boxes_art(k.to_s, v)}
        result << ranged_art
    end
    
    private
    # load monster model art using database ascii_model
    def drawing_lines
        self.ascii_model.split("\n")
    end

    # function to draw boxes art for the stats
    def boxes_art(name, val)
        # 8 Spaces and val for the margin
        art = "        #{name} : "
        
        # calculate black boxes
        black_boxes = (val/20.to_f).ceil
        (1..black_boxes).each {|box| art += "⬛"}
        
        # calculate white boxes
        white_boxes = 5 - black_boxes
        (1..white_boxes).each {|box| art += "⬜"}

        # add number
        art += " #{val}"

        art
    end

    def ranged_art
        "        ranged : #{self.ranged ? '✔' : '✘'}"
    end
end