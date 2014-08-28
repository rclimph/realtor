module SharedHelper
  def floor_humanized(floor)
    case
    when floor < 0
      val = "B" + (floor*-1).to_s
    when floor == 1
      val = "Ground Floor"
    else
      val = floor.ordinalize + " Floor"
    end
    return val   
  end
end