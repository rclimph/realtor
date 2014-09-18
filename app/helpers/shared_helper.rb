module SharedHelper
  def floor_humanized(floor) # Turn floor into human readable format
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
  
  def caret_link(label, path)
    return link_to(raw(label + ' <b class="caret"></b>'), path, :data => { :toggle => "dropdown" })
  end
end