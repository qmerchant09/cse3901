=begin
    File created 10/2 by Selemon
    File edited 10/2 by Selemon: created storingArticles method
    File edited 10/6 by Roberto D: Added methods to generate html output file
    Edited 10/6 by selemon:added output the url and date of article to the outtput html file 
    File edited 10/7 by Amyas D: added display_url_info function to write_article function
    Edited 10/8 by Gavin A: Fixed logic in storingArticles, changed method names from camel case
    Edited 10/10 by Gavin A: moved some more methods to generate_file

    html file for the data that the user is asking for using the aforementioned methods
=end
require_relative './article.rb'
require_relative './connect.rb'
require_relative './url.rb'
require 'mechanize'
require 'nokogiri'
require 'httparty'
=begin
    Created 10/6 by Roberto D: Created an outFile variable to be passed to methods to write file
    Edited 10/6 by Roberto D: Wrote the <html> tags call writeHead and write_body
    Edited 10/8 by Gavin A: Moved output.html to its own folder, moved logic in writeHead to this method
    Edited 10/10 by Gavin A: Moved sequential puts statements to one line, moved write_body to this method
    
    @param <article> is the article that is being scraped
    @param <mechanize> is the Ruby gem that helps scrape articles
    Generates the output html file by creating a file and calling methods to write to the file
=end
def write_file articles, mechanize
    outFile = File.new "htmlFiles/output.html", "w"
    outFile.puts "<!DOCTYPE html>\n<html lang =\"en\">\n\t<head>\n\t\t<title>OSU News Summary</title>\n\t</head>\n\t<body>"
    articles.each_with_index {|article, index| write_article outFile, article, index, mechanize}
    outFile.puts "\t</body>\n</html>"
end
=begin
    Created 10/6 by Roberto: Wrote the headline, description, and author of the article
    Edited 10/6 by Quantez Merchant: Added images, edited the h tags 
    Edited 10/6 by selemon : added output the url of article to the outtput html file 
    Edited 10/6 by selemon : added output the date of article to the outtput html file and
                             corrected a syntax error with output the url
    Edited 10/8 by Gavin A: Now places url info in a separate file for each article
    Edited 10/10 by Gavin A: Correcting the href link for local files to include quotation marks
    Edited 10/10 by Amyas D: Formal Comments

    This method takes the @parmam <outFile> that will display all of the scraped data and
    prints the headline, date, description, and author of each article to the output html file.
    @param <article> is the article that is being scraped
    @param <index> is the index of the article being scraped
    @param <mechanize> is the Ruby gem that helps scrape articles
=end
def write_article outFile, article, index, mechanize
    outFile.puts "\n\t\t<p><img src=\"#{article.image}\" alt = \"#{article.headline}\" width=\"600\" height=\"500\"></p>"
    outFile.puts "\t\t<h2>#{article.headline}</h2>"
    outFile.puts "\t\t<p>#{article.date}</p>"
    outFile.puts "\t\t<p>#{article.description}</p>"
    outFile.puts "\t\t<p>#{article.author}</p>"
    outFile.puts "\t\t<a href = \"#{article.url}\" target = \"_blank\">#{article.url}</a>"
    htmlName = "#{index}-article"
    display_url_info htmlName, article.url, mechanize
    outFile.puts "\n\t\t<br>\n\t\t<p><a href = \"linkFiles/#{htmlName}.html\">Links Contained in the Article</a></p>"
end

=begin
    created 10/2/22 by Selemon
    Edited 10/06/22 by selemon: changing the functionality to grab and hold the articls, 
    renaming the method and creating an array for the articles
    Edited 10/7 by Quantez Merchant: Edited link loop
    Edited 10/8 by Gavin A: Simplified logic in the each loop by only using the elemet and not the index
    Edited 10/10 by Gavin A: Removed the creation of a new page (as return value of get_topic_page is a page)
                            Changed var names to be more readable

    Takes a string array @param <topicArr> as the first parameter containing the topics that articles will be pulled from
    Takes an instance of @param <mechanize> as the second parameter
    @Returns an array containing each article pulled from the osu news site
=end                 
def storing_articles topicArr, mechanize
    articleArr = []
    topicArr.each do |element|
        page = get_topic_page element, mechanize
        link = page.css('div.mm_listitem h3 a')
        link.length.times {|i| articleArr << Article.new("https:" + link[i].to_s.match(/(\/\/.*\/")/).captures[0].chomp('"'))}
    end 
    articleArr     
end