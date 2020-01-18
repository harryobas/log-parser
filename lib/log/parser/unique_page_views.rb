class Log::Parser::UniquePageViews
  attr_reader :pages_views
  def initialize(pages_views)
    @pages_views = pages_views
  end
end
