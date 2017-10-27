require "http/server"
require "./blockchain/blockchain"

blockchain = Blockchain.new
blockchain.addBlock 1_i64, "1"
puts blockchain.lastBlock.index

# server = HTTP::Server.new(8080) do |context|
#     context.response.content_type = "text/plain"
#     context.response.print "Hello world! The time is #{Time.now}"
# end

# puts "Listening on 127.0.0.1:8080"

# server.listen
