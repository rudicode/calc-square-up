# Given plate dimensions, calcualtes length of time for squaring up plates
#
# [ Perimeter Length x 20{passes per inch} x ( PLATE_Thickness + 0.350 ) ] / 50{in/min}
#
class Squareup
  attr_accessor :plate_thickness, :plate_x, :plate_y
  
  def initialize (thick, x, y)
    @plate_thickness = thick
    @plate_x = x
    @plate_y = y
  end
  
  def perimeter
    (plate_x + plate_y) * 2
  end
  
  def plunge_time
    ( perimeter * 20 * (@plate_thickness + 0.350) ) / 50
  end
  
  def chamfer_time
    # (perimeter [in] / 15 [ipm] ) * 2 [plate sides]
    ( perimeter / 15) * 2
  end
  
  def setup_time
    # 1h per plate
    60.0
  end
  
  def total_time
    plunge_time + chamfer_time + setup_time
  end
end
