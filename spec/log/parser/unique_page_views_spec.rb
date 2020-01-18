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
      views = Log::Parser::UniquePageViews.new(page_views)
      expect(views).not_to eq nil
      expect(views.pages_views).to be_a Array
      expect(views.pages_views.any?{|h| h[:url] == "/about"}).to eq true
      expect(views.pages_views.any?{|h| h[:ip] == "126.318.035.038"}).to eq true
    end
  end
end
