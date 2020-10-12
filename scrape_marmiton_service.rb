class ScrapeMarmitonService
    def initialize(keyword)
      @keyword = keyword
      @scraped_recipes = []
    end
  
    def call
      html_file = open("https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=#{@keyword}").read
      html_doc = Nokogiri::HTML(html_file)
      html_doc.search('.recipe-card').take(5).each do |element|
        name = element.css(".recipe-card__title").text.strip
        description = element.css(".recipe-card__description").text.strip
        prep_time = element.css(".recipe-card__duration__value").text.strip
        rating = "rating: #{element.css('.recipe-card__rating__value').text.strip}/5"
        @scraped_recipes << { name: name, description: description, prep_time: prep_time, rating: rating }
      end
      return @scraped_recipes
    end
  end
  