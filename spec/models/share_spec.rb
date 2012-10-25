require 'spec_helper'

describe Share do
  it "is a thing" do
    share = Share.new
    share.should_not be_nil
  end
  it "belongs to an impression" do
    impression = Impression.create
    share = impression.shares.create
    share.impression.should == impression
  end
end
