=begin
 File created 9/29 by Gavin A
 Eidted 10/1 by Gavin A: Created tests for all topics
 Edited 10/4 by Gavin A: Fixed hyperlink for test 5
 Edited 10/5 by Gavin A: Fixed incorrect tests
 Edited 10/6 by Gavin A: Added tests for new methods
=end

require "test/unit"
require "mechanize"
require_relative '../connect.rb'

class GetTopicPageTest < Test::Unit::TestCase
=begin
    Created 9/29 by Gavin A
    Edited 10/4 by Gavin A: Changed the end of the link to read as /campus/
    Ensures that getting the campus page with get_topic_page functions as intended
=end
    def test_topic_page_1
        mechanize = Mechanize.new
        expectedPage = mechanize.get 'https://news.osu.edu/campus/'
        topic = "Campus"
        page = get_topic_page topic,mechanize
        assert_equal expectedPage.uri, page.uri
    end

=begin
     Created 9/29 by Gavin A
     Edited 10/5 by Gavin A: Changed the link to include '/' at the end
     Tests the get_topic_page function to pull up the Science & Education page
=end
     def test_topic_page_2
        mechanize = Mechanize.new
        expectedPage = mechanize.get 'https://news.osu.edu/science-and-medicine/'
        topic = "Science & Medicine"
        page = get_topic_page topic,mechanize
        assert_equal expectedPage.uri, page.uri
    end

=begin
    Created 10/1 by Gavin A
    Tests the get_topic_page function to pull up the Arts & Humanities page
=end
    def test_topic_page_3
        mechanize = Mechanize.new
        expectedPage = mechanize.get 'https://news.osu.edu/arts-and-humanities/'
        topic = "Arts & Humanities"
        page = get_topic_page topic,mechanize
        assert_equal expectedPage.uri, page.uri
    end

=begin
    Created 10/1 by Gavin A
    Tests the get_topic_page function to pull up the The Conversation page
=end
    def test_topic_page_4
        mechanize = Mechanize.new
        expectedPage = mechanize.get 'https://news.osu.edu/the-conversation/'
        topic = "The Conversation"
        page = get_topic_page topic,mechanize
        assert_equal expectedPage.uri, page.uri
    end

=begin
    Created 10/1 by Gavin A
    Edited 10/4 by Gavin A: Changed the end of the link to read as /sports/
    Tests the get_topic_page function to pull up the Sports page
=end
    def test_topic_page_5
        mechanize = Mechanize.new
        expectedPage = mechanize.get 'https://news.osu.edu/sports/'
        topic = "Sports"
        page = get_topic_page topic,mechanize
        assert_equal expectedPage.uri, page.uri
    end

=begin
    Created 10/1 by Gavin A
    Tests the get_topic_page function to pull up the COVID-19 page
=end
    def test_topic_page_6
        mechanize = Mechanize.new
        expectedPage = mechanize.get 'https://news.osu.edu/covid-19-updates/'
        topic = "COVID-19"
        page = get_topic_page topic,mechanize
        assert_equal expectedPage.uri, page.uri
    end

=begin
    Created 10/6 by Gavin A
    Tests that to_extension removes every type of whitespace
=end
    def test_to_extension_1
        topic = "hello\tmy\nfriend"
        expectedTopic = 'hello-my-friend'
        assert_equal expectedTopic, (to_extension topic)
    end

=begin
    Created 10/6 by Gavin A
    Tests that to_extension makes every letter downcase
=end
    def test_to_extension_2
        topic = "TeStINg"
        expectedTopic = 'testing'
        assert_equal expectedTopic, (to_extension topic)
    end

=begin
    Created 10/6 by Gavin A
    Tests that to_extension replaces '&' with 'and'
=end
    def test_to_extension_3
        topic = "&and&"
        expectedTopic = 'andandand'
        assert_equal expectedTopic, (to_extension topic)
    end

=begin
    Created 10/6 by Gavin A
    Ensures 11 links are pulled from each topic's page
=end
    def test_get_articles_1
        topicArr = ["Campus","Science & Medicine","Arts & Humanities","The Conversation","Sports"]
        mechanize = Mechanize.new
        topicArr.each do |topic|
            page = get_topic_page topic,mechanize
            array = get_articles page
            assert_equal 11, array.length
        end   
    end

#   Ensures that the COVID-19 page generates 6 articles
    def test_get_articles_2
        mechanize = Mechanize.new
        topic = "COVID-19"
        page = get_topic_page topic,mechanize
        array = get_articles page
        array.each {|link| puts link.uri}
        assert_equal 6, array.length   
    end
end