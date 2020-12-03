class Scraper
    BASE_URL= "http://books.toscrape.com/"

    def self.scrape_books
        opened_url = URI.open(BASE_URL)
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

    def self.scrape_books_by_genre(url)
        opened_url = URI.open(BASE_URL + url)
        doc = Nokogiri::HTML(opened_url)
        book_tiles = doc.css("article")
        book_tiles.collect do |book|
            hash = {
                title: book.css("h3 a").attr("title").value,
                rating: book.css("p").attr("class").value.split(" ").last,
                availability: book.css("p.instock.availability").text.strip,
                price: book.css("div.product_price p.price_color").text.strip,
                url: book.css("h3 a").attr("href").value
            }
            Book.find_or_create(hash)
        end
    end

    def self.scrape_genres
        opened_url = URI.open(BASE_URL)
        doc = Nokogiri::HTML(opened_url)
        genres = doc.css("div.side_categories > ul > li > ul > li > a")
        genres.each do |genre|
            # binding.pry
            hash = {
                name: genre.text.strip,
                url: genre.attr("href")
            }
            Genre.find_or_create(hash)
        end
    end

end