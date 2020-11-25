class Clis
    attr_reader :books

    def run
        puts "welcome to my books app!"
        Scraper.scrape_books
        # binding.pry
        puts "Here is a our list of books:"
        list_books
        user_selection
    end

    def list_books
        @books = Book.all
        books.each.with_index(1) do |book, i|
            puts "#{i}. #{book.title}"
        end
    end

    def user_selection
        puts "Type the number corresponding to the book you'd like to know more about, or type exit to leave"
        input = gets.strip
        converted_input = input.to_i
        while input.downcase != "exit"
            if converted_input.between?(1, 20)
                book = Book.all[converted_input - 1]
                display_book_info(book)
                break
            else
                puts "Wrong input! Please type a integer between 1 and #{books.length}"
                user_selection
            end
        end
        puts "Type 'back' to go back to the main menu or 'exit' to exit"
        # new_input = gets.strip
        # if back
        #     list_books
        #     user_selection
        # elsif exit

        # else
        #     wrong input, please gtype back or exit only
        # end
    end


    def display_book_info(book)
        puts "#{book.title}"
        puts "#{book.price}"
        puts "#{book.rating}"
        puts "#{book.availability}"
    end

end