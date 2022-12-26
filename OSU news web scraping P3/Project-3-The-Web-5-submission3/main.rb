# Created by Quantez Merchant on 10/6
require_relative './connect.rb'
require_relative './userInput.rb'
require_relative './article.rb'
require_relative './sort.rb'
require_relative './html.rb'
require 'mechanize'

=begin
    Created by Quantez Merchant on 10/7
    The main method prompts the user for topics and a sorting method, 
    gathers the articles from the specified topics, sorts the articles, 
    and then outputs an HTML file containing the articles and their data
=end
def main
    topic = get_topic
    sort = get_sort
    mechanize = Mechanize.new
    puts "Please wait while the articles are gathered."
    articleArr = storing_articles topic, mechanize
    if sort == "alphabetical"
        sortedArr = alphabetical_sort articleArr
    elsif sort == "author"
        sortedArr = author_sort articleArr
    else
        sortedArr = date_sort articleArr
    end
    write_file sortedArr,mechanize
    puts "Output file generated"
end
main

