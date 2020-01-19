require "spec_helper"

RSpec.describe Log::Parser::ParserFacade do

  let :result do
  [["/help_page/1", 5], ["/about", 5], ["/index", 4], ["/home", 1], ["/about/2", 1]]
end

  context "initalization" do
    it "initalizes with a file path" do
      file = File.expand_path("spec/fixtures/web.log")
      expect(Log::Parser::ParserFacade.new(file)).not_to eq nil
    end
    it "raises error when file does not exist" do
      file = "server.log"
      expect{Log::Parser::ParserFacade.new(file)}.to raise_error(Log::Parser::Error, "file not found")
    end
  end
end
