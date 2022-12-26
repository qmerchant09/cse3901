=begin 
    File created on 9/28 by Quantez Merchant 
    Recieves 2 inputs from the user, what topics they want articles from, and how they want the articles sorted on the output file 
=end

=begin
    Created on 9/28 by Quantez Merchant 
    Edited on 9/29 by Quantez Merchant: Added code to the method 
    Edited on 10/3 by Quantez Merchant: Restructured method 
    Edited on 10/4 by Quantez Merchant: Restructured method 
    Edited 10/6 by Gavin A: Fixed spelling of Humanities
    Edited on 10/6 by Quantez Merchant: Restructured method 
    Edited on 10/7 by Quantez Merchant: Made more terse 
    Prompts the user for the categories they want their articles from 
    @Returns an array of strings representing the specified categories
=end
def get_topic
    topicArr = ["Campus","Science & Medicine","Arts & Humanities","The Conversation","Sports","COVID-19"]
    topicArr.length.times { |index| puts index.to_s + ": " + topicArr[index]}
    topicReturn = []
    print "Enter the indicies of the categories you want articles from (ex. 123): "
    until topic = gets.chomp.match(/^[0-6]{1,6}$/) do print "Enter the indexes of the categories you want articles from (ex. 123): " end
    topic.to_s.split(//).each {|index| topicReturn << topicArr[index.to_i]}
    topicReturn.uniq
end

=begin
    Created on 9/28 by Quantez Merchant 
    Edited on 9/29 by Quantez Merchant: Added code to the method
    Edited on 10/3 by Quantez Merchant: Restructured method 
    Edited on 10/4 by Quantez Merchant: Restructured method 
    Edited on 10/7 by Quantez Merchant: Made more terse 
    Prompts the user for the sorting method they want for their articles
    @Returns a string representing the specified sort method
=end
def get_sort
    sortArr = ["alphabetical","author","date"]
    sortArr.length.times { |index| puts index.to_s + ": " + sortArr[index]}
    print "Enter the index of the sort method you want applied to the articles: " 
    until sort = gets.chomp.match(/^[0-2]$/) do print "Enter the index of the sort method you want applied to the articles: " end 
    sortArr[sort.to_s.to_i]
end