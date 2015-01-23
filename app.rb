require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/hair_salon")
require("./lib/clientel")
require("pg")

DB = PG.connect({:dbname => "hair_salon"})

get ("/") do
	@stylists = Stylist.all()
	erb(:index)
end

post("/stylists") do
  name = params.fetch("name")
  new_stylist = Stylist.new({:name => name, :id => nil})
  new_stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end

get("/stylist/:id") do
  @patron = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end

post("/patron") do
  clients = params.fetch("description")
  list_id = params.fetch("list_id").to_i()
  new_client = Client.new({:clients => clients, :list_id => list_id})
  new_client.save()
  @patron = Stylist.find(list_id)
  erb(:stylist)
end