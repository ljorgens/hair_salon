class Stylist
	attr_reader(:name, :stylist_id)
	
	define_method(:initialize) do |attributes|
		@name = attributes.fetch(:name)
		@stylist_id = attributes.fetch(:stylist_id)
	end
	
	define_singleton_method(:all) do
		stylist_array = []
		returned_stylists = DB.exec("SELECT * FROM clippers;")
		returned_stylists.each() do |names|
			name = names.fetch("name")
			stylist_id = names.fetch("stylist_id").to_i()
			stylist_array.push(Stylist.new({:name => name, :stylist_id => stylist_id}))
		end
		stylist_array
	end
		
	define_method(:save) do 
		DB.exec("INSERT INTO clippers (name, stylist_id) VALUES ('#{@name}', #{@stylist_id});")
	end
	
	define_method(:==) do |another_stylist|
    	self.name().==(another_stylist.name()).&(self.stylist_id().==(another_stylist.stylist_id()))
  end
end