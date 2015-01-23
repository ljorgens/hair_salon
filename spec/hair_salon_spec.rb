require ("spec_helper")

describe(Stylist) do
	describe('#name') do
		it("returns the name of the person cutting hair") do
			test_haircut = Stylist.new({:name => "Samantha", :stylist_id => nil})
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
			test_haircut = Stylist.new({:name => "Samantha", :stylist_id => 1})
			test_haircut.save()
			expect(Stylist.all()).to(eq([test_haircut]))
		end
	end
	
	describe("#==") do
    it("is the same task if it has the same description and list ID") do
      test_haircut1 = Stylist.new({:name => "steve", :stylist_id => 1})
      test_haircut2 = Stylist.new({:name => "steve", :stylist_id => 1})
      expect(test_haircut1).to(eq(test_haircut2))
    end
  end
  describe("#stylist_id") do
  	it("returns the stylist id for a selected stylist") do
  		test_haircut = Stylist.new({:name => "chris", :stylist_id => 2})
  		expect(test_haircut.stylist_id()).to(eq(2))
  	end
  end
end