require 'spec_helper'

describe Impression do

  describe "creating an impression" do
    it "should set the viewed_at and viewed_on timestamps" do
      site = Site.create(name: "www.test.com")
      impression = site.impressions.new
      impression.viewed_on.should be_nil
      impression.viewed_at.should be_nil
      impression.save
      impression.viewed_at.class.should == ActiveSupport::TimeWithZone
      impression.viewed_on.class.should == Time
    end
  end
end
