class Author
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

    def find_by_name(name)
        all.find {|author| author.name == name}
    end

    def self.find_or_create(hash)
        find_by_name(hash["name"]) || new(hash)
    end
end