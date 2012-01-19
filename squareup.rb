# Given plate dimensions, calcualtes length of time for squaring up plates
#
# [ Perimeter Length x 20{passes per inch} x ( PLATE_Thickness + 0.350 ) ] / 50{in/min}
#
class Squareup
  attr_accessor :plate_thickness, :plate_x, :plate_y
  
  def initialize (thick, x, y)
    @plate_thickness = thick  #plate thicknes in inches
    @plate_x = x              #x size in inches
    @plate_y = y              #y size in inches
    @passes_per_inch = 20
    @added_thickness = 0.350  #in inches extra to account for plunging past the part
    @plunge_tool_feed = 50.0  #feed in inches per minute
    @chamfer_tool_feed = 15.0 #feed in inches per minute
    
    # need error checking of input variables

end
  
  def perimeter
    (plate_x + plate_y) * 2
  end
  
  def plunge_time
    # calculate number of seconds it takes to complete
    ( perimeter * @passes_per_inch * (@plate_thickness + @added_thickness) ) / @plunge_tool_feed
  end
  
  def chamfer_time
    # (perimeter [in] / 15 [ipm] ) * 2 [plate sides]
    ( perimeter / @chamfer_tool_feed) * 2
  end
  
  def setup_time
    # 1h per plate (4 mini setups)
    60.0
  end
  
  def total_time
    plunge_time + chamfer_time + setup_time
    # add up all times
  end
end
