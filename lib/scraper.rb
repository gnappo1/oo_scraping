class Scraper
    BASE_URL= "http://books.toscrape.com/"

    def self.scrape_books
        opened_url = open(BASE_URL)
        doc = Nokogiri::HTML(opened_url)
        book_tiles = doc.css("article")
        book_tiles.each do |book|
            hash = {
                title: book.css("h3 a").attr("title").value,
                rating: book.css("p").attr("class").value.split(" ").last,
                availability: book.css("p.instock.availability").text.strip,
                price: book.css("div.product_price p.price_color").text.strip
            }
            Book.new(hash)
        end
    end

end