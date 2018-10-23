
class Gossip

    attr_accessor :author, :content

    def initialize(author,content)
        @author = author
        @content = content
    end

    def save #may need to add an ID ??!
        CSV.open("./db/gossip.csv", "ab") do |csv|
            csv << [@author, @content]
          end
    end

    def self.all
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
    end

    def find(my_gossip_id) # pbm is: how to find out this ID ??

    end

end