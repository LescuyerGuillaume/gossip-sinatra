class Gossip
	attr_accessor :author, :content, :all_gossips

	def initialize(author, content)
		@author = author
		@content = content
	end

	def save
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

#Récupère l'id entrée par l'utilisateur et renvoie le potin ayant l'index correspondant
	def self.find(id)
		@id = id.to_i
		all_gossips = Gossip.all
		return all_gossips[@id - 1]
	end

#La méthode permettant l'édition d'un potin n'est pas complète
#Je n'ai pas trouvé comment modifier une ligne du CSV pour intégrer les nouvelles données
	#def self.update(author, content, id)
		#@new_author = author
		#@new_content = content
		#@id = id.to_i
		#CSV.open("./db/gossip.csv", "ab") do |csv|
		#	csv << [@new_author, @new_content]
		#end
	#end
end
