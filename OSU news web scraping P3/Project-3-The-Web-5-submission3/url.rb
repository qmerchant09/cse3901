
=begin File created on 10/1 by Amyas Dawson: 
Edited on 10/3 by Amyas D: Removed 'return' keywords from functions
Edited on 10/7 by Amyas D: Refactored display_url_info function
Edited 10/8 by Gavin A: Switched to using hashMap, not using camel case for variables
Edited 10/10 by Amyas D: Comments


Populates all the url's in the selected article embedded into the webpage for an individual article along
 with its corresponding link title. There is a method for looping through each article pulled and 
 inserting its information into the file for the html output file 
=end

require_relative './article.rb'
require 'mechanize'
require'nokogiri'
require 'httparty'

=begin
    Created on 10/1 by Amyas D
    Edited 10/8 by Gavin A: Switched to using a hash map so that the link and text can both be used
    Edited 10/10 by Quantez Merchant: Changed the links that the method searches for 

    Gets all of the url's in the selected @param <articleUrl> using mechanize and returns an
    hashmap containing the links and their text
=end
def get_url articleUrl, mechanize
    document = mechanize.get articleUrl
    linkHash = Hash.new{|url,text| url[text] = [] }
    document.search('div.pp-overflow-hidden a').each {|link| linkHash[link['href']] = link.text}
    linkHash
end


=begin 
    Created on 10/1 by Amyas D
    Edited 10/7 by Amyas D: Refactored code
    Edited 10/8 by Gavin A: Switched to printing out the url and the text for each link on the page
    Edited 10/10 by Quantez Merchant: Made the links on the new page clickable 

    Uses the get_url function to display the title and its corresponding url on the html output file
=end
def display_url_info headlineExt, articleUrl, mechanize
    outFile = File.new "htmlFiles/linkFiles/#{headlineExt}.html", "w"
    outFile.puts "<!DOCTYPE html>\n<html lang =\"en\">\n\t<head>\n\t\t<title>OSU News Summary</title>\n\t</head>"
    outFile.puts "<table>\n\t<caption>Article urls</caption>\n\t<tr>\n\t\t<th>URL</th>\n\t\t<th>Text</th>\n\t</tr>"
    linkHash = get_url articleUrl, mechanize
    linkHash.each {|link, text| outFile.puts "\n\t<tr>\n\t\t<td><a href=\"#{link}\" target=\"_blank\">#{link}</a></td>\n\t\t<td>#{text.strip}</td>\n\t</tr>"}
    outFile.puts "</table>\n</html>"
end