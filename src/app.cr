require "./server/server"
require "./blockchain/blockchain"

blockchain = Blockchain.new
blockchain.addBlock 1_i64, "1"
puts blockchain.lastBlock.index

require "http/server"

app = Server::ServerWithRouting.new

app.get "/" do rootHandler end
app.get "/test" do testHandler end


def rootHandler
    puts "root"
    "root"
end

def testHandler
    puts "test"
    "test"
end

app.run 8080