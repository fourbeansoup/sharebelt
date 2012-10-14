require 'spec_helper'

describe Impression do
  let(:site) {Site.create(name: "www.test.com")}

  describe "creating an impression" do
    it "should set the viewed_at and viewed_on timestamps" do
      impression = site.impressions.new
      impression.viewed_on.should be_nil
      impression.viewed_at.should be_nil
      impression.save
      impression.viewed_at.class.should == ActiveSupport::TimeWithZone
      impression.viewed_on.class.should == Time
    end

    context "with a landing url" do
      before do
        @impression = site.impressions.new
      end

      describe "with a new landing url" do
        it "should create a landing url and refrence it" do
          lambda {
            @impression.landing_url = "http://mynewblog.com/article1"
          }.should change(LandingUrl, :count).by(1)
        end
      end

      describe "with an existing landing url" do
        before do
          LandingUrl.create(url: "http://mynewblog.com/article2")
        end

        it "should use the existing landing url if matching" do
          lambda {
            @impression.landing_url = "http://mynewblog.com/article2"
          }.should_not change(LandingUrl, :count)
        end

      end
    end

    context "with a referring url" do
      before do
        @impression = site.impressions.new
      end

      describe "with a new referring url" do
        it "should create a referring url and refrence it" do
          lambda {
            @impression.referring_url = "http://t.co/article1"
          }.should change(ReferringUrl, :count).by(1)
        end
      end

      describe "with an existing referring url" do
        before do
          ReferringUrl.create(url: "http://t.co/article2")
        end

        it "should use the existing referring url if matching" do
          lambda {
            @impression.referring_url = "http://t.co/article2"
          }.should_not change(ReferringUrl, :count)
        end

      end
    end

  end
end
