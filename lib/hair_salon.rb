class Stylist
	attr_reader(:name, :id)
	
	define_method(:initialize) do |attributes|
		@name = attributes.fetch(:name)
		@id = attributes.fetch(:id)
	end
	
	define_singleton_method(:all) do
		stylist_array = []
		returned_stylists = DB.exec("SELECT * FROM clippers;")
		returned_stylists.each() do |names|
			name = names.fetch("name")
			id = names.fetch("id").to_i()
			stylist_array.push(Stylist.new({:name => name, :id => id}))
		end
		stylist_array
	end
		
	define_method(:save) do 
		result = DB.exec("INSERT INTO clippers (name) VALUES ('#{@name}') RETURNING id;")
		@id = result.first().fetch("id").to_i()
	end
	
	define_method(:==) do |another_stylist|
    	self.name().==(another_stylist.name()).&(self.id().==(another_stylist.id()))
  end
  	
  	define_singleton_method (:find) do |id|
    	found_stylist = nil
    	Stylist.all().each() do |style|
      		if style.id().==(id)
        		found_stylist = style
      		end
    	end
    	found_stylist
    end
    
    define_method(:clients) do
    	stylist_styles = []
    	client_result = DB.exec("SELECT * FROM clients WHERE list_id = #{self.id()};")
    	client_result.each() do |client|
      		description = client.fetch("description")
      		client_id = client.fetch("client_id").to_i()
      		stylist_styles.push(Client.new({:description => description, :client_id => list_id}))
    end
    	stylist_styles
  end
end