require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/hair_salon")
require("pg")

DB = PG.connect({:dbname => "hair_salon"})

get ("/") do
	@hair_salon = Stylist.all()
	erb(:index)
end

post("/stylists") do
  name = params.fetch("stylist")
  new_stylist = Stylist.new({:name => name, :id => nil})
  new_stylist.save()
  @hair_salon = Stylist.all()
  erb(:index)
end

get("/hair_salon/:id") do
  @hair_salon = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end