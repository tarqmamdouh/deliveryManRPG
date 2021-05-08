class Monster < ActiveRecord::Base
  # when compat show monster stats with some text
  def spawn(text)
    art_lines = ascii_art
    text_lines = text.split("\n")
    # write the text next to the monster ascii
    # we use line 7 as starting point
    text_lines.each_with_index { |tline, index| art_lines[index + 7] << ' ' * 15 << tline }
    DrawingEngine.draw(art_lines)
  end

  private

  def ascii_art
    result = drawing_lines
    result << [' ' * 120]
    result << {
      hp: hp,
      armor: armor,
      damage: damage
    }.map { |k, v| boxes_art(k.to_s, v) }
    result << ranged_art
  end

  # load monster model art using database ascii_model
  def drawing_lines
    ascii_model.split("\n")
  end

  # function to draw boxes art for the stats
  def boxes_art(name, val)
    # 8 Spaces and val for the margin
    art = "        #{name} : "

    # calculate black boxes
    black_boxes = (val / 20.to_f).ceil
    (1..black_boxes).each { |_box| art += '⬛' }

    # calculate white boxes
    white_boxes = 5 - black_boxes
    (1..white_boxes).each { |_box| art += '⬜' }

    # add number
    art += " #{val}"

    art
  end

  def ranged_art
    "        ranged : #{ranged ? '✔' : '✘'}"
  end
end
