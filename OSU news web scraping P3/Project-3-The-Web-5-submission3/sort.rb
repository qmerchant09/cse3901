=begin 
    File created on 10/5 by Quantez Merchant 
    Sorts an array 3 different ways, depending on the users preference
=end
require 'date'

=begin
    Created 10/5 by Quantez Merchant
    Takes an array of articles @param <articleArr>
    @Returns an array of articles sorted alphabetically    
=end
def alphabetical_sort articleArr
    articleArr.sort_by {|article| article.headline.downcase}
end

=begin
    Created 10/5 by Quantez Merchant
    Takes an array of articles @param <articleArr>  
    @Returns an array of articles sorted by date published   
=end
def date_sort articleArr
    articleArr.sort_by {|article| Date.parse(article.date)}.reverse
end

=begin
    Created 10/5 by Quantez Merchant
    Takes an array of articles @param <articleArr> 
    @Returns an array of articles sorted by author   
=end
def author_sort articleArr
    articleArr.sort_by {|article| article.author}
end