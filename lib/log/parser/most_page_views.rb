class Log::Parser::MostPageViews
  attr_reader :pages
  def initialize(pages)
    @pages = pages
  end
  def most_viewed
    pages.group_by(&:itself)
    .each_with_object({}){|(k,v), hash| hash[k] = v.size}
    .to_a.sort_by{|_, n| n}.reverse
  end
end
