require "squareup"


  def display_report(pl)
    puts "Using Plate Thickness: #{ pl.plate_thickness }"
    puts "Using Plate X: #{pl.plate_x}"
    puts "Using Plate Y: #{pl.plate_y}"
    puts "Perimeter is: #{pl.perimeter}"
    puts "Plunge Roughing Time: #{pl.plunge_time}"
    puts "Chamfer         Time: #{pl.chamfer_time}"
    puts "Setup           Time: #{pl.setup_time}"
    puts "---------------------------------"
    puts "Total           Time: #{pl.total_time}"
  end

# setup defailt plate size
@plate_z = 3.0
@plate_x = 10.123
@plate_y = 15.234

# get input from cammand line to create a new plate.

if ARGV.length == 3
  #puts "You entered the following #{ARGV.length} command line arguments:"
  #ARGV.each do|arg|
  #  puts "#{arg}"
  #end
  @plate_z = ARGV[0].to_f
  @plate_x = ARGV[1].to_f
  @plate_y = ARGV[2].to_f

end
plate = Squareup.new(@plate_z, @plate_x, @plate_y)

display_report(plate)
