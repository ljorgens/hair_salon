require("rspec")
require("pg")
require("hair_salon")
require("clientel")

DB = PG.connect({:dbname => "hair_salon_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM clippers *;")
    DB.exec("DELETE FROM patrons *;")
  end
end