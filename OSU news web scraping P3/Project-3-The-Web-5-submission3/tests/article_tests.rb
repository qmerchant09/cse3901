# File created 10/1 by Roberto D
require "test/unit"
require "nokogiri"
require 'httparty'
require_relative '../article.rb'

class ArticleTest < Test::Unit::TestCase
=begin
    Created 10/7/22 by selemon
    Tests date of  article 1
=end
 
def test_date_1
    @document = Article.new "https://news.osu.edu/university-issues-2021-crime-report-overview-of-safety-resources/"
    date = @document.date
    expectedDate = 'September 30, 2022'
    assert_equal expectedDate, date
end
=begin
   Created 10/7/22 by selemon
    Tests date of  article 2
=end
def test_date_2
    @document = Article.new "https://news.osu.edu/ohio-state-athletics-administrator-phyllis-bailey-passes/"
    date = @document.date
    expectedDate = 'October 03, 2022'
    assert_equal expectedDate, date
end
=begin
     Created 10/7/22 by selemon
    Tests url of  article 1
=end
def test_url_1
    @document = Article.new "https://news.osu.edu/ohio-state-athletics-administrator-phyllis-bailey-passes/"
    url = @document.url
    expectedUrl = 'https://news.osu.edu/ohio-state-athletics-administrator-phyllis-bailey-passes/'
    assert_equal expectedUrl, url
end
=begin
    Created 10/7/22 by selemon
    Tests url of  article 2
=end
def test_url_2
    @document = Article.new "https://news.osu.edu/university-issues-2021-crime-report-overview-of-safety-resources/"
    url = @document.url
    expectedUrl = 'https://news.osu.edu/university-issues-2021-crime-report-overview-of-safety-resources/'
    assert_equal expectedUrl, url
end
    
=begin
    Created 10/1 by Roberto De Jesus
    Tests author with sample article 1
=end
    def test_author_1
        @document = Article.new 'https://news.osu.edu/recovery-month-celebrates-students-in-and-seeking-recovery-from-substance-misuse/'
        author = @document.author
        expectedAuthor = 'Franny Lazarus '
        assert_equal expectedAuthor, author
    end
=begin
    Created 10/1 by Roberto De Jesus
    Tests author with sample article 2
=end
    def test_author_2
        @document = Article.new 'https://news.osu.edu/young-kids-avoid-one-learning-trap-that-often-snares-adults/'
        author = @document.author
        expectedAuthor = 'Jeff Grabmeier'
        assert_equal expectedAuthor, author
    end
=begin
    Created 10/1 by Roberto De Jesus
    Tests author with sample article 3
=end
    def test_author_3
        @document = Article.new 'https://news.osu.edu/wexner-center-student-program-encourages-creativity-community/'
        author = @document.author
        expectedAuthor = 'Franny Lazarus '
        assert_equal expectedAuthor, author
    end
=begin
    Created 10/1 by Roberto De Jesus
    Tests author with sample article 4
=end
    def test_author_4
        @document = Article.new 'https://news.osu.edu/marching-band-brings-shrek-to-life/'
        author = @document.author
        expectedAuthor = 'Evan Drexler'
        assert_equal expectedAuthor, author
    end
=begin
    Created 10/1 by Roberto De Jesus
    Tests author with sample article 5
=end
    def test_author_5
        @document = Article.new 'https://news.osu.edu/15m-gift-from-austin-e-knowlton-foundation-to-help-transform-ohio-state-engineering-campus/'
        author = @document.author
        expectedAuthor = 'The Ohio  State University'
        assert_equal expectedAuthor, author
    end
=begin
    Created 10/1 by Roberto De Jesus
    Tests headline with sample article 1
=end
    def test_headline_1
        @document = Article.new 'https://news.osu.edu/recovery-month-celebrates-students-in-and-seeking-recovery-from-substance-misuse/'
        headline = @document.headline
        expectedHeadline = 'Recovery Month celebrates students in and seeking recovery from substance misuse'
        assert_equal expectedHeadline, headline
    end
=begin
    Created 10/1 by Roberto De Jesus
    Tests headline with sample article 2
=end
    def test_headline_2
        @document = Article.new 'https://news.osu.edu/young-kids-avoid-one-learning-trap-that-often-snares-adults/'
        headline = @document.headline
        expectedHeadline = 'Young kids avoid one learning trap that often snares adults'
        assert_equal expectedHeadline, headline
    end
=begin
    Created 10/1 by Roberto De Jesus
    Tests headline with sample article 3
=end
    def test_headline_3
        @document = Article.new 'https://news.osu.edu/wexner-center-student-program-encourages-creativity-community/'
        headline = @document.headline
        expectedHeadline = 'Wexner Center student program encourages creativity, community'
        assert_equal expectedHeadline, headline
    end
=begin
    Created 10/1 by Roberto De Jesus
    Tests headline with sample article 4
=end
    def test_headline_4
        @document = Article.new 'https://news.osu.edu/marching-band-brings-shrek-to-life/'
        headline = @document.headline
        expectedHeadline = "Marching Band brings ‘Shrek’ to life"
        assert_equal expectedHeadline, headline
    end
=begin
    Created 10/1 by Roberto De Jesus
    Tests headline with sample article 5
=end
    def test_headline_5
        @document = Article.new 'https://news.osu.edu/15m-gift-from-austin-e-knowlton-foundation-to-help-transform-ohio-state-engineering-campus/'
        headline = @document.headline
        expectedHeadline = '$15M gift from Austin E. Knowlton Foundation to help transform Ohio State engineering campus'
        assert_equal expectedHeadline, headline
    end
=begin
    Created 10/1 by Roberto De Jesus
    Tests description with sample article 1
=end
    def test_description_1
        @document = Article.new 'https://news.osu.edu/recovery-month-celebrates-students-in-and-seeking-recovery-from-substance-misuse/'
        description = @document.description
        expectedDesc = 'Collegiate Recovery Community provides additional events, resources during September'
        assert_equal expectedDesc, description
    end
=begin
    Created 10/1 by Roberto De Jesus
    Tests description with sample article 2
=end
    def test_description_2
        @document = Article.new 'https://news.osu.edu/young-kids-avoid-one-learning-trap-that-often-snares-adults/'
        description = @document.description
        expectedDesc = 'Children can’t focus attention, which can sometimes be helpful'
        assert_equal expectedDesc, description
    end
=begin
    Created 10/1 by Roberto De Jesus
    Tests description with sample article 3
=end
    def test_description_3
        @document = Article.new 'https://news.osu.edu/wexner-center-student-program-encourages-creativity-community/'
        description = @document.description
        expectedDesc = 'Pages initiative connects area schools with art and artists'
        assert_equal expectedDesc, description
    end
=begin
    Created 10/1 by Roberto De Jesus
    Tests description with sample article 4
=end
    def test_description_4
        @document = Article.new 'https://news.osu.edu/marching-band-brings-shrek-to-life/'
        description = @document.description
        expectedDesc = 'Music from beloved film closes out 5 weeks of consecutive halftime shows'
        assert_equal expectedDesc, description
    end
=begin
    Created 10/1 by Roberto De Jesus
    Tests description with sample article 5
=end
    def test_description_5
        @document = Article.new 'https://news.osu.edu/15m-gift-from-austin-e-knowlton-foundation-to-help-transform-ohio-state-engineering-campus/'
        description = @document.description
        expectedDesc = 'Supports final phase of Biomedical and Materials Engineering Complex'
        assert_equal expectedDesc, description
    end

=begin
    Created 10/3 by Quantez Merchant
    Tests image with sample article 1
=end
    def test_image_1
        @document = Article.new 'https://news.osu.edu/recovery-month-celebrates-students-in-and-seeking-recovery-from-substance-misuse/'
        imgLink = @document.image
        expectedimgLink = 'https://content.presspage.com/uploads/2170/1920_recoverymonth-twitter.jpg?10000'
        assert_equal expectedimgLink, imgLink
    end

=begin
    Created 10/3 by Quantez Merchant
    Tests image with sample article 2
=end
    def test_image_2
        @document = Article.new 'https://news.osu.edu/young-kids-avoid-one-learning-trap-that-often-snares-adults/'
        imgLink = @document.image
        expectedimgLink = 'https://content.presspage.com/uploads/2170/1920_kidscantfocus.jpg?10000'
        assert_equal expectedimgLink, imgLink
    end

=begin
    Created 10/3 by Quantez Merchant
    Tests image with sample article 3
=end
    def test_image_3
        @document = Article.new 'https://news.osu.edu/wexner-center-student-program-encourages-creativity-community/'
        imgLink = @document.image
        expectedimgLink = 'https://content.presspage.com/uploads/2170/1920_kds-20211207-21080-0052.jpg?10000'
        assert_equal expectedimgLink, imgLink
    end

=begin
    Created 10/3 by Quantez Merchant
    Tests image with sample article 4
=end
    def test_image_4
        @document = Article.new 'https://news.osu.edu/ohio-state-professor-curates-beyond-guilt-exhibition/'
        imgLink = @document.image
        expectedimgLink = 'https://content.presspage.com/uploads/2170/1920_beyondguilt.jpeg?10000'
        assert_equal expectedimgLink, imgLink
    end

=begin
    Created 10/3 by Quantez Merchant
    Tests image with sample article 5
=end
    def test_image_5
        @document = Article.new 'https://news.osu.edu/15m-gift-from-austin-e-knowlton-foundation-to-help-transform-ohio-state-engineering-campus/'
        imgLink = @document.image
        expectedimgLink = 'https://content.presspage.com/uploads/2170/1920_ontherightbmecrsquosfirstphasemarsg.fontanalaboratories.tothelefttheformermacquigglaboratorieswhichwillberenovatedduringphasetwo..jpg?10000'
        assert_equal expectedimgLink, imgLink
    end

end
