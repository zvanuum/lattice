require "./server/server"
require "./server/handlers"
require "./blockchain/blockchain"

blockchain = Blockchain.new
app = Server::ServerWithRouting.new

app.get "/mine" do getMineHandler end
app.get "/chain" do getChainHandler blockchain end

app.post "/transaction/new" do
    puts "test 2"
end

app.run 8080