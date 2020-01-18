require "spec_helper"

RSpec.describe Log::Parser::MostVisitedPagesExtractor do
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
      pages_extractor = Log::Parser::MostVisitedPagesExtractor.new(pages)
      expect(pages_extractor).not_to eq nil
      expect(pages_extractor).to be_a Log::Parser::MostVisitedPagesExtractor
      expect(pages_extractor.pages).to be_a Array
      expect(pages_extractor.pages.empty?).to eq false
    end
  end
  describe "#most_viewed" do
    it "returns a list of pages with most views ordered from highest to lowest" do
      pages_extractor = Log::Parser::MostVisitedPagesExtractor.new(pages)
      expect(pages_extractor.most_viewed).to eq [["/about", 5], ["/contact", 4], ["/help_page/1", 3], ["/home", 2]]
    end
    
  end

end
