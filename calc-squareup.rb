# Given plate dimensions, calcualtes length of time for squaring up plates
#
# [ Perimeter Length” x 20{passes per inch} x ( PLATE_Thickness” + 0.350” ) ] / 50{in/min}
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
  
  def display_report
    puts "Using Plate Thickness: #{@plate_thickness}"
    puts "Using Plate X: #{@plate_x}"
    puts "Using Plate Y: #{@plate_y}"
    puts "Perimeter is: #{perimeter}"
    puts "Plunge Roughing Time: #{plunge_time}"
    puts "Chamfer         Time: #{chamfer_time}"
    puts "Setup           Time: #{setup_time}"
    puts "---------------------------------"
    puts "Total           Time: #{total_time}"
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

plate = Squareup.new(3.0, 26, 24)
plate.display_report
