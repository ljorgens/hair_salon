require ("spec_helper")

describe(Client) do
  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_client = Client.new({:clients => "christ", :list_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe("#clients") do
    it("lets you read the clients out") do
      test_client = Client.new({:clients => "Garth", :list_id => 1})
      expect(test_client.clients()).to(eq("Garth"))
    end
  end

  describe("#list_id") do
    it("lets you read the list ID out") do
      test_client = Client.new({:clients => "Ray", :list_id => 1})
      expect(test_client.list_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same task if it has the same clients and list ID") do
      client1 = Client.new({:clients => "Steve", :list_id => 1})
      client2 = Client.new({:clients => "Steve", :list_id => 1})
      expect(client1).to(eq(client2))
    end
  end
end