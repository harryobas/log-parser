require "log/parser/most_page_views"
require "log/parser/unique_page_views"

class Log::Parser::ParserFacade
  def initialize(file_path)

    @file_path = file_path

    raise Log::Parser::Error.new, "file not found" unless File.exist?(@file_path)
    raise Log::Parser::Error.new, "file is empty" if File.zero?(@file_path)

    raw_lists = extract_raw_lists(@file_path)

    @most_viewed_raw = raw_lists.first
    @most_page_views = Log::Parser::MostPageViews.new(@most_viewed_raw)

    @unique_raw = raw_lists.last
    @unique_page_views = Log::Parser::UniquePageViews.new(@unique_raw)
  end

  def list_of_most_viewed_pages
    @most_page_views.most_viewed
  end

  def list_of_unique_page_views
    @unique_page_views.unique_visits
  end

  private

  def extract_raw_lists(file)
    unique_raw = File.open(file) do |f|
      f.map{|line| {url: line.split[0], ip: line.split[1]}}
    end

    most_viewed_raw = unique_raw
    .map{|r| r[:url]}

    [most_viewed_raw, unique_raw]
  end

end
