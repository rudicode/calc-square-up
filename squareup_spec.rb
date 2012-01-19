# require "./squareup"
require File.expand_path('../squareup', __FILE__)

describe "squareup" do
  
  before(:each) do
    @myplate = Squareup.new(3.0,10.123,15.234)
  end
  
  it "should calculate perimeter of plate" do
    @myplate.perimeter.should == 50.714
  end
  
  it "should calculate time taken for roughing perimeter" do
    # formula is: [ Perimeter Length x 20{passes per inch} x ( PLATE_Thickness + 0.350 ) ] / 50{in/min}
    @myplate.plunge_time.should be_within(0.0001).of(67.9567)
  end
  
  it "should calculate time taken for chamfering" do
    # formula is: Perimeter * chmfer_ipm[15.0] * #of_sides[2]
    @myplate.chamfer_time.should be_within(0.0001).of(6.7618)
  end

  it "should calculate time taken for part setup" do
    # forumla is: 1h per plate
    @myplate.setup_time.should be_within(0.0001).of(60.0)
  end
  
  it "should calculate total time" do
    # @myplate.total_time.should be_close(134.7185, 0.0002)
    @myplate.total_time.should be_within(0.0002).of(134.7185)
  end
end
