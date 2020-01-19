require "spec_helper"

RSpec.describe Log::Parser::ParserFacade do

  context "initalization" do
    it "initalizes with a file path" do
      file = File.expand_path("spec/fixtures/web.log")
      expect(Log::Parser::ParserFacade.new(file)).not_to eq nil
    end
    it "raises error when file does not exist" do
      file = "server.log"
      expect{Log::Parser::ParserFacade.new(file)}.to raise_error(Log::Parser::Error, "file not found")
    end
    it "raises error when file is empty" do
      file = File.expand_path("spec/fixtures/web_empty.log")
      expect{Log::Parser::ParserFacade.new(file)}.to raise_error(Log::Parser::Error, "file is empty")
    end
  end
  describe "#list_of_unique_page_views" do
    it "gets list of unique page views" do
      file = File.expand_path("spec/fixtures/web.log")
      parser_facade = Log::Parser::ParserFacade.new(file)
      Log::Parser::UniquePageViews.any_instance.expects(:unique_visits)
      parser_facade.list_of_unique_page_views
    end
  end
  describe "#list_of_most_viewed_pages" do
    it "gets list of most viewd pages" do
      file = File.expand_path("spec/fixtures/web.log")
      parser_facade = Log::Parser::ParserFacade.new(file)
      Log::Parser::MostPageViews.any_instance.expects(:most_viewed)
      parser_facade.list_of_most_viewed_pages
    end

  end

end
