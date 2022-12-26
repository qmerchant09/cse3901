=begin
File created 9/29 by Gavin Adams: Created a method that will allow the program to connect to a webpage
Edited 10/5 by Gavin A: fixed logic in get_topic_page by removing :text param in page.link_with call
Edited 10/6 by Gavin A: Added to_extension and get_articles
=end
require 'mechanize'

=begin
Created 9/29 by Gavin A
Edited 10/4 by Gavin A: Removed debug message and changed the link_with params to include the topic text & href using regex
Edited 10/5 by Gavin A: Removed :text param for link_with so it only searches for a specific link given through regex
                        Removed parentheses
Edited 10/6 by Gavin A: Moved the logic for editing the topic to another method

Takes a string parameter @param <topic> containing the topic of the news articles to generate
@param <mechanize> is the Ruby gem that helps scrape articles
 @Returns the page with the articles under the topic page on the osu site
=end
def get_topic_page topic, mechanize
    page = mechanize.get 'https://news.osu.edu/'
    uri = page.link_with :href => /\/\/news.osu.edu\/#{to_extension topic}/
    topicPage = mechanize.get uri.uri
end

=begin
Created 10/6 by Gavin A

Takes @param <topic> string containing the topic of the news articles to generate and @returns the 
string with whitespace chars replaced with '-' and '&' replaced with 'and'
=end
def to_extension topic
    topic.gsub! /\s/, "-"
    topic.gsub! "&", "and"
    topic.downcase
end

=begin
Created 10/6 by Gavin A

Takes a @param <page> webpage as a parameter and @returns an array of links of the 
news articles on the page
=end
def get_articles page
    page.links_with :class => 'pp_bigheadlines_more'
end