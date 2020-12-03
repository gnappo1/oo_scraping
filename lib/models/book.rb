class Book
    @@all = []
    
    def initialize(hash) #with metaprogramming
        hash.each do |key, value|
            self.class.attr_accessor key
            self.send("#{key}=", value)
        end
        save
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.sorted_books
        all.sort_by(&:title)
    end

    def self.display_grid_of_books(books)
        books_table = TTY::Table.new(header: ["Id", "Book Title"])
        books.each.with_index(1) do |book, i| 
            books_table << ["#{i}".red, "#{book.title}"]
        end
        puts books_table.render(:unicode)
    end

    def display_book_info
        books_table = TTY::Table.new(header: ["Title", "Price", "Rating", "Availability"])
        books_table << ["#{title}".red, "#{price}", "#{rating}", "#{availability}"]
        puts books_table.render(:unicode)
    end

    def self.find_by_title(title)
        all.find {|book| book.title == title}
    end

    def self.find_or_create(hash)
        find_by_title(hash["title"]) || new(hash)
    end
end
