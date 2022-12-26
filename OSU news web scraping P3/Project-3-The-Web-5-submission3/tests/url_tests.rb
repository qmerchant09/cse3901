# File created 10/10 by Amyas D
require "test/unit"
require "nokogiri"
require 'httparty'
require_relative '../url.rb'

class UrlTest < Test::Unit::TestCase
=begin
    Created 10/10 by Amyas D.
    Tests link in 0-th index of link array from the link test with sample article 1
=end
    def test_link_1
        @document = Article.new 'https://news.osu.edu/recovery-month-celebrates-students-in-and-seeking-recovery-from-substance-misuse/'
        mechanize = Mechanize.new 
        link = get_url @document.url, mechanize
        expectedlink = 'https://www.samhsa.gov/recovery-month'
        assert_equal expectedlink, link.key('National Recovery Month')
    end
=begin
    Created 10/10 by Amyas D
    Tests link in 1st index of link array from the link test with sample article 2
=end
    def test_link_2
        @document = Article.new 'https://news.osu.edu/wexner-center-student-program-encourages-creativity-community/'
        mechanize = Mechanize.new 
        link = get_url @document.url, mechanize
        expectedlink = 'https://wexarts.org/education/pages'
        assert_equal expectedlink, link.key('Pages') 
    end
=begin
    Created 10/10 by Amyas D
    Tests link in 2nd index of link array from the link test with sample article 3
=end
    def test_link_3
        @document = Article.new 'https://news.osu.edu/young-kids-avoid-one-learning-trap-that-often-snares-adults/'
        mechanize = Mechanize.new 
        link = get_url @document.url, mechanize
        expectedlink = 'https://www.sciencedirect.com/science/article/abs/pii/S0022096522001771'
        assert_equal expectedlink, link.key('Journal of Experimental Child Psychology')
    end
=begin
    Created 10/10 by Amyas D
    Edited 10/10 by Gavin A: Fixed map error
    Tests link in 3rd index of link map from the link test with sample article 4
=end
    def test_link_4
        @document = Article.new 'https://news.osu.edu/15m-gift-from-austin-e-knowlton-foundation-to-help-transform-ohio-state-engineering-campus/'
        mechanize = Mechanize.new 
        link = get_url @document.url, mechanize
        expectedlink = 'https://aekfoundation.org/'
        assert_equal expectedlink, link.key('Austin E. Knowlton Foundation')
    end
=begin
    Created 10/10 by Amyas D
    Tests that there are no links in the array from the link test with sample article 5
=end
    def test_link_5
        @document = Article.new 'https://news.osu.edu/marching-band-brings-shrek-to-life/'
        mechanize = Mechanize.new 
        link = get_url @document.url, mechanize
        expectedlink = {}
        assert_equal expectedlink, link
    end
end 