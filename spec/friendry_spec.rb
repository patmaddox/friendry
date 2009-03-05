require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Friendry, private methods" do
  before(:each) do
    @shy_guy = ShyGuy.new 'Pat'
    @cute_girl = CuteGirl.new
    @hs_buddy = HsBuddy.new
  end

  it "should be private when not befriended" do
    lambda { @cute_girl.ask_name @shy_guy}.
      should raise_error(NoMethodError)
  end

  it "should allow access when befriended" do
    @hs_buddy.ask_name(@shy_guy).should == 'Pat'
  end

  it "should not expose itself just because it's been befriended" do
    @hs_buddy.ask_name(@shy_guy)
    lambda { @cute_girl.ask_name @shy_guy}.
      should raise_error(NoMethodError)
  end
end

describe "Friendry, test befriending" do
  before(:each) do
    @super_geek = SuperGeek.new 'Pat'
    @other_geek = SuperGeek.new 'Pat #2'
    @old_classmate = HsBuddy.new
  end

  it "should not allow objects not meeting the conditions" do
    lambda { @old_classmate.ask_name @super_geek }.
      should raise_error(NoMethodError)
  end

  it "should allow objects that meet the conditions" do
    @other_geek.ask_name(@super_geek).should == 'Pat'
  end
end
