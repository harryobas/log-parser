require "spec_helper"

RSpec.describe Log::Parser::UniquePageViews do

  let :page_views do
    [
       {:url=>"/index", :ip=>"126.318.035.038"},
       {:url=>"/about", :ip=>"722.247.931.582"},
       {:url=>"/index", :ip=>"336.284.013.698"},
       {:url=>"/about", :ip=>"682.704.613.213"},
       {:url=>"/index", :ip=>"336.284.013.698"},
       {:url=>"/index", :ip=>"444.701.448.104"},
       {:url=>"/about/2", :ip=>"061.945.150.735"},
       {:url=>"/help_page/1", :ip=>"336.284.013.698"},
       {:url=>"/about", :ip=>"451.106.204.921"},
       {:url=>"/help_page/1", :ip=>"646.865.545.408"},
       {:url=>"/help_page/1", :ip=>"715.156.286.412"},
       {:url=>"/help_page/1", :ip=>"126.318.035.038"},
       {:url=>"/home", :ip=>"217.511.476.080"},
       {:url=>"/help_page/1", :ip=>"543.910.244.929"},
       {:url=>"/about", :ip=>"722.247.931.582"},
       {:url=>"/about", :ip=>"336.284.013.698"},
    ]
  end

  context "initialization" do
    it "initializes with a list of viewd pages and associated ip address" do
      unique_views = Log::Parser::UniquePageViews.new(page_views)
      expect(unique_views).not_to eq nil
      expect(unique_views.pages_views).to be_a Array
      expect(unique_views.pages_views.empty?).to eq false
    end
  end

  describe "#unique_visits" do
    it "returns a list of unique page views ordered from highest to lowest" do
      unique_views = Log::Parser::UniquePageViews.new(page_views)
      expect(unique_views.unique_visits).to eq [["/about", 1], ["/index", 1], ["/home", 0], ["/help_page/1", 0], ["/about/2", 0]]
    end
  end

end
