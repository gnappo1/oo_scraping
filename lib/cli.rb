class Cli
    attr_reader :genres
    # GENRES = Genre.sorted_genres

    def run
        puts "welcome to my books app!".green
        Scraper.scrape_genres
        puts "Here is a our list of our genres:".green
        list_genres
        genre_selection
    end

    def list_genres
        Genre.display_grid_of_sorted_genres
    end

    def display_book_img(img="http://books.toscrape.com/media/cache/3d/54/3d54940e57e662c4dd1f3ff00c78cc64.jpg")

        # img = Magick::Image::read(img).first
        # img.each_pixel do |pixel, col, row|
        #     c = [pixel.red, pixel.green, pixel.blue].map { |v| 256 * (v / 65535.0) }
        #     # binding.pry
        #     # pixel.opacity && pixel.opacity == 65535 ? print("  ") : print("  ".bg c)
        #     puts if col >= img.columns - 1
        # end
        # Catpix::print_image "test_image.jpg",
        #     :limit_x => 1.0,
        #     :limit_y => 0,
        #     :center_x => true,
        #     :center_y => true,
        #     :bg => "white",
        #     :bg_fill => true,
        #     :resolution => "low"
    end

    def genre_selection
        puts "Type the number corresponding to the genre you'd like to know more about, or type exit to leave"
        input = gets.strip
        converted_input = input.to_i
        @genres = Genre.sorted_genres
        while input.downcase != "exit"
            if converted_input.between?(1, genres.size)
                genre = genres[converted_input - 1]
                books = Scraper.scrape_books_by_genre(genre.url).sort_by(&:title)
                display_books(books)
                break
            else
                puts "Wrong input! Please type a integer between 1 and #{genres.length}".red
                genre_selection
            end
        end
        puts "Type the number of the book you'd like to know more of, or 'back' to go back to the main menu, or 'exit' to exit".yellow
        book_selection(books)
        # new_input = gets.strip
        # if back
        #     list_books
        #     user_selection
        # elsif exit

        # else
        #     wrong input, please gtype back or exit only
        # end
    end

    def book_selection(books)
        input = gets.strip
        converted_input = input.to_i
        while input.downcase != "exit"
            if converted_input.between?(1, books.size)
                book = books[converted_input - 1]
                book.display_book_info
                break
            else

            end
        end
        puts "Type 'back' to go back to the list of books, or 'exit' to exit, or type 'more' to check out more info about this book".yellow
        
        binding.pry
    end

    def display_books(books)
        Book.display_grid_of_books(books)
    end

end