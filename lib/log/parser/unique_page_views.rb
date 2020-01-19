class Log::Parser::UniquePageViews
  attr_reader :pages_views

  def initialize(pages_views)
    @pages_views = pages_views
  end

  def unique_visits
    pages_views
    .group_by{|request| request[:url]}
    .each{|url, requests| requests.map!{|r| r[:ip]}}
    .each_with_object({}){|(k,v), hash| hash[k] = reduce(v)}
    .to_a.sort_by{|_, n| n}.reverse
  end

  private

  def reduce(arr)
    arr
    .select{|a| arr.count(a) > 1}
    .uniq.size
  end

end
