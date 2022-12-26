# File created 10/8/22 by selemon
require "test/unit"
require "nokogiri"
require 'httparty'
require "mechanize"
require_relative '../article.rb'
require_relative '../sort.rb'
require_relative '../html.rb'
require_relative '../url.rb'
require_relative '../connect.rb'
class HtmlTest < Test::Unit::TestCase
=begin
    Created 10/8/22 by selemon
    Tests storing_articles 1
=end
  def test_storing_articles_1
     topicArr = ["Campus","Science & Medicine","Arts & Humanities","The Conversation","Sports","COVID-19"]
     arr = [] 
     mechanize = Mechanize.new
     arr = storing_articles topicArr, mechanize
     expectedArr = 61
     assert_equal expectedArr, arr.length
  end 
end
