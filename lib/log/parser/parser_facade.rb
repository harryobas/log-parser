require "log/parser/most_page_views"
require "log/parser/unique_page_views"

class Log::Parser::ParserFacade
  def initialize(file_path)
    raise Log::Parser::Error.new, "file not found" unless File. exist?(file_path)
  end

end
