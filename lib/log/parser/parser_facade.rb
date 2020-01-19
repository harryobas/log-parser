require "log/parser/most_page_views"
require "log/parser/unique_page_views"

class Log::Parser::ParserFacade
  def initialize(file_path)
    raise Log::Parser::Error.new, "file not found" unless File.exist?(file_path)
    raise Log::Parser::Error.new, "file is empty" if File.zero?(file_path)

    @unique_raw = extract_unique_views_raw_list(file_path)
    @unique_page_views = Log::Parser::UniquePageViews.new(@unique_raw)
  end

  def list_of_unique_page_views
    @unique_page_views.unique_visits
  end

  private

  def extract_unique_views_raw_list(file)
    File.open(file) do |f|
      f.map{|line| {url: line.split[0], ip: line.split[1]}}
    end
  end 

end
