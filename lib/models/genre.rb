class Genre

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

    def self.sorted_genres
        all.sort_by(&:name)
    end

    def self.display_grid_of_sorted_genres
        genres_table = TTY::Table.new(header: ["Id", "Genre Name"])
        sorted_genres.each.with_index(1) do |genre, i| 
            genres_table << ["#{i}".red, "#{genre.name}"]
        end
        puts genres_table.render(:unicode)
    end

    def self.find_by_name(name)
        all.find {|genre| genre.name == name}
    end

    def self.find_or_create(hash)
        find_by_name(hash["name"]) || new(hash)
    end
end