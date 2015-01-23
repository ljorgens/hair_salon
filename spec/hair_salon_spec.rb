require ("spec_helper")

describe(Stylist) do
	describe('#name') do
		it("returns the name of the person cutting hair") do
			test_haircut = Stylist.new({:name => "Samantha", :id => nil})
			expect(test_haircut.name()).to(eq("Samantha"))
		end
	end
	
	describe('.all') do
		it("returns everything in the array. Nothing at first") do
			expect(Stylist.all()).to(eq([]))
		end
	end
	
	describe("#save") do
		it("puts new stylists into database and array") do
			test_haircut = Stylist.new({:name => "Samantha", :id => nil})
			test_haircut.save()
			expect(Stylist.all()).to(eq([test_haircut]))
		end
	end
	
	describe("#==") do
    it("is the same task if it has the same description and list ID") do
      test_haircut1 = Stylist.new({:name => "steve", :id => nil})
      test_haircut2 = Stylist.new({:name => "steve", :id => nil})
      expect(test_haircut1).to(eq(test_haircut2))
    end
  end
  describe("#id") do
  	it("returns the stylist id for a selected stylist") do
  		test_haircut = Stylist.new({:name => "chris", :id => nil})
  		test_haircut.save()
  		expect(test_haircut.id()).to(be_an_instance_of(Fixnum))
  	end
  end
  describe(".find") do
    it("returns a stylist by ID number") do
      test_haircut = Stylist.new({:name => "Sean", :id => nil})
      test_haircut.save()
      test_haircut2 = Stylist.new({:name => "Steve", :id => nil})
      test_haircut2.save()
      expect(Stylist.find(test_haircut2.id())).to(eq(test_haircut2))
    end
  end
end