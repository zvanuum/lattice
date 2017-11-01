require "./server/server"
require "./server/handlers"
require "./blockchain/blockchain"

blockchain = Blockchain.new
app = Server::ServerWithRouting.new

# app.get "/mine" do
#     puts "test"
# end

app.get "/chain" do 
    response = JSON.build do |json|
        json.object do
            json.field "chain", blockchain.chain.to_json
            json.field "length", blockchain.chain.size
        end
    end

    response
end

# def chainHandler(blockchain : Blockchain) : String
#     response = JSON.build do |json|
#         json.object do
#             json.field "chain", blockchain.chain.to_json
#             json.field "length", blockchain.chain.size
#         end
#     end

#     response
# end

app.post "/transaction/new" do
    puts "test 2"
end

app.run 8080