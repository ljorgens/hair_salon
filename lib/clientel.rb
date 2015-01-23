class Client
  attr_reader(:clients, :list_id)

  define_method(:initialize) do |attributes|
    @clients = attributes.fetch(:clients)
    @list_id = attributes.fetch(:list_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM patrons;")
    clients = []
    returned_clients.each() do |client|
      clients = client.fetch("clients")
      list_id = client.fetch("list_id").to_i()
      clients.push(Client.new({:clients => clients, :list_id => list_id}))
    end
    clients
  end

  define_method(:save) do
    DB.exec("INSERT INTO patrons (clients, list_id) VALUES ('#{@clients}', #{@list_id});")
  end

  define_method(:==) do |another_client|
    self.clients().==(another_client.clients()).&(self.list_id().==(another_client.list_id()))
  end
end