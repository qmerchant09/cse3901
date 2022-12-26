=begin
    File created 10/1 by Roberto D
    Edited 10/10 by Gavin A: Changed a var name
    Article class creates a representation of the HTML of an article
=end
require 'nokogiri'
require 'httparty'

class Article
=begin
    Created 10/1 by Roberto D
    Edited 10/7/22 by selemon: setting @link = link 
    Edited 10/10 by Gavin A: Changed the var link to url

    Constructs a document object of the article with the url parameter using the Nokogiri gem
=end
    def initialize url
        @url = url
        response = HTTParty.get url
        if response.code != 200
            puts "Error: #{response.code}"
            exit
        end
        @document = Nokogiri::HTML4 response.body
    end
=begin
    created 9/27/22 by selemon
    Edited 9/30/22 by selemon
    Edited 10/06/22 by selemon: refactoring and changing names 
    Edited 10/08/22 by selemon: refactoing the code in t single line 
    Edited 10/08/22 by selemon: puting in a single line is made too long and affecting the html out put
    Edited 10/10 by Gavin A: Condesed to one lines
    A method to grab the date of individual articles from 
       the osu news page in https://news.osu.edu/
=end   
    def date
        @document.css('div.pp_date_month')[0].text + " " + @document.css('div.pp_date_day')[0].text + ", " + @document.css('div.pp_date_year')[0].text
    end 
=begin
    created 9/27/22 by selemon
    Edited 9/30/22 by selemon
    Edited 10/7/22 by selemon: refactoring the code by setting @link = link in the initialize method
    Edited 10/10 by Gavin A: Now using attr_reader to get the url
    A method to grab the url of articls 
=end
    attr_reader :url
=begin
    Created 10/1 by Roberto D
    Gets the author of the article
=end
    def author
        if !@document.search("div.pp_contactdiv_name")[0].to_s.empty?
            @document.search("div.pp_contactdiv_name")[0].text
        elsif !@document.search('h6 strong')[0].to_s.empty?
            @document.search('h6 strong').text
        end   
    end
=begin
    Created 10/1 by Roberto D  
    Gets the headline of the article
=end
    def headline
        @document.css('div.title_companyprofile')[0].text    
    end
=begin
    Created 10/1 by Roberto D
    Gets the description of the article
=end
    def description
        if @document.css('div.subtitle_case')[0] != nil then @document.css('div.subtitle_case')[0].text end
    end
=begin
    Created 10/1 by Quantez Merchant
    Edited 10/4 by Quantez Merchant: restructured method
    Edited 10/8 by Quantez Merchant: restructured method 
    Gets the image attached to the article and retruns a string representing the url to that image 
=end
    def image
        if !@document.search("ul.pp_slides a")[0].to_s.empty?
            "https:" + @document.search("ul.pp_slides a")[0].to_s.match(/\/\/content.*?"/).to_s.chomp('"')
        elsif !@document.search('div.gallery_thumbnail_single img')[0].to_s.empty?
            "https:" + @document.search('div.gallery_thumbnail_single img')[0].to_s.match(/(\/\/.*?")/).captures[0].chomp('"')
        elsif !@document.search('p img')[0].to_s.empty?
            "https:" + @document.search('p img')[0].to_s.match(/(\/\/.*?")/).captures[0].chomp('"')
        else
            "https:" + @document.css('img').to_s.match(/(\/\/.*?")/).captures[0].chomp('"')
        end   
    end 
end
