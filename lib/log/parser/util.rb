class String
  def green; colorize(self, "\e[1m\e[32m"); end
  def red; colorize(self, "\e[1m\e[31m"); end
  def colorize(text, color_code) "#{color_code}#{text}\e[0m" end
end
