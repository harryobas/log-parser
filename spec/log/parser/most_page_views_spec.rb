require "spec_helper"

RSpec.describe Log::Parser::MostPageViews do
  let :pages do
    [

      "/help_page/1",
      "/contact",
      "/about",
      "/about",
      "/home",
      "/help_page/1",
      "/home",
      "/help_page/1",
      "/contact",
      "/contact",
      "/contact",
      "/about",
      "/about",
      "/about"
    ]
  end

  context "initialization" do
    it "initializes with a list of visited pages" do
      most_page_views = Log::Parser::MostPageViews.new(pages)
      expect(most_page_views).not_to eq nil
      expect(most_page_views.pages).to be_a Array
      expect(most_page_views.pages.empty?).to eq false
      expect(most_page_views.pages.any?{|p| p == "/contact"}).to eq true
    end
  end

  describe "#most_viewed" do
    it "returns a list of pages with most views ordered from highest to lowest" do
      most_page_views = Log::Parser::MostPageViews.new(pages)
      expect(most_page_views.most_viewed).to eq [["/about", 5], ["/contact", 4], ["/help_page/1", 3], ["/home", 2]]
    end
  end

end
