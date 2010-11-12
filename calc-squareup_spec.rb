require "calc-squareup"

describe "calc-squareup" do
  before (:each) do
    @myplate = Squareup.new(3.0,10.123,15.234)
  end
  it "should caculate perimeter of plate" do
    @myplate.perimeter.should == 50.714
  end
  it "should calculate time taken for roughing perimeter" do
    # formula is: [ Perimeter Length” x 20{passes per inch} x ( PLATE_Thickness” + 0.350” ) ] / 50{in/min}
    @myplate.plunge_time.should be_close(67.9567, 0.0001)
  end
  it "should calculate time taken for chamfering" do
    # formula is: Perimeter * chmfer_ipm[15.0] * #of_sides[2]
    @myplate.chamfer_time.should be_close(6.7618, 0.0001)
  end
  it "should calculate time taken for part setup" do
    # forumla is: 1h per plate
    @myplate.setup_time.should be_close(60.0, 0.0001)
  end
  it "should calculate total time" do
    @myplate.total_time.should be_close(134.7185, 0.0002)
  end
  it "should display calculations to user" 
    # capture {@myplate.display_report}.should =~ /Perimeter/
    
    #@myplate.should_receive.4.times(:puts)
    #@myplate.display_report
    
    # @myplate2 = Squareup.new(3.0,10.123,15.234)
    # @myplate2.display_report #.should # contain output for perimeter ie. Perimeter: 50.174
end
