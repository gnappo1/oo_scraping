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
end