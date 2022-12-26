require "test/unit"
require_relative '../article.rb'
require_relative '../sort.rb'


class SortTest < Test::Unit::TestCase
=begin
    Created 10/5 by Quantez Merchant
    Tests the alphabetcal sort method 
=end
    def test_alphabetical_sort
        arr = [Article.new('https://news.osu.edu/ohio-state-prepares-for-110th-homecoming-festivities/'),Article.new('https://news.osu.edu/wexner-center-student-program-encourages-creativity-community/') ,Article.new('https://news.osu.edu/ohio-state-news-alert-new-covid-19-vaccine-boosters-and-flu-shots-available/')]
        arrSort = alphabetical_sort arr
        expectedArr = [Article.new('https://news.osu.edu/ohio-state-news-alert-new-covid-19-vaccine-boosters-and-flu-shots-available/') ,Article.new('https://news.osu.edu/ohio-state-prepares-for-110th-homecoming-festivities/'),Article.new('https://news.osu.edu/wexner-center-student-program-encourages-creativity-community/')]
        assert_equal expectedArr[0].headline,arrSort[0].headline
        assert_equal expectedArr[1].headline,arrSort[1].headline
        assert_equal expectedArr[2].headline,arrSort[2].headline
    end

=begin
    Created 10/5 by Quantez Merchant
    Tests the date sort method
=end
    def test_date_sort
        arr = [Article.new('https://news.osu.edu/ohio-state-news-alert-new-covid-19-vaccine-boosters-and-flu-shots-available/') ,Article.new('https://news.osu.edu/ohio-state-prepares-for-110th-homecoming-festivities/'),Article.new('https://news.osu.edu/wexner-center-student-program-encourages-creativity-community/')]
        arrSort = date_sort arr
        expectedArr = [Article.new('https://news.osu.edu/ohio-state-news-alert-new-covid-19-vaccine-boosters-and-flu-shots-available/'), Article.new('https://news.osu.edu/wexner-center-student-program-encourages-creativity-community/'), Article.new('https://news.osu.edu/ohio-state-prepares-for-110th-homecoming-festivities/')]
        assert_equal expectedArr[0].date,arrSort[0].date
        assert_equal expectedArr[1].date,arrSort[1].date
        assert_equal expectedArr[2].date,arrSort[2].date
    end

=begin
    Created 10/5 by Quantez Merchant
    Tests the author sort method
=end
    def test_author_sort
        arr = [Article.new('https://news.osu.edu/ohio-state-news-alert-new-covid-19-vaccine-boosters-and-flu-shots-available/') ,Article.new('https://news.osu.edu/ohio-state-prepares-for-110th-homecoming-festivities/'),Article.new('https://news.osu.edu/wexner-center-student-program-encourages-creativity-community/')]
        arrSort = author_sort arr
        expectedArr = [Article.new('https://news.osu.edu/ohio-state-prepares-for-110th-homecoming-festivities/'),Article.new('https://news.osu.edu/wexner-center-student-program-encourages-creativity-community/') ,Article.new('https://news.osu.edu/ohio-state-news-alert-new-covid-19-vaccine-boosters-and-flu-shots-available/')]
        assert_equal expectedArr[0].author,arrSort[0].author
        assert_equal expectedArr[1].author,arrSort[1].author
        assert_equal expectedArr[2].author,arrSort[2].author
    end
end