module NumbersToColours
  
  BG_COLOURS = {
    "red" => 41,
    "green" => 42,
    "yellow" => 43,
    "blue" => 44,
    "magenta" => 45,
    "cyan" => 46
  }
  
  def number_to_colour(number)
    case number
    when 1 then coloured_block("red")
    when 2 then coloured_block("green")
    when 3 then coloured_block("yellow")
    when 4 then coloured_block("blue")
    when 5 then coloured_block("magenta")
    when 6 then coloured_block("cyan")
    else "  #{number}  "
    end
  end

  def coloured_block(colour)
    "\e[#{BG_COLOURS[colour]}m     \e[0m"
  end
end