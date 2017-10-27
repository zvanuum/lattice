require "time"
require "openssl"

require "./block"
require "./transaction"

class Blockchain
    property chain
    property currentTransactions
    
    def initialize
        @chain = [] of Block
        @currentTransactions = [] of Transaction

        # Genesis block
        puts hashBlock addBlock 100_i64, "1"
    end

    # Add a block to the end of the block
    # Returns the new block
    def addBlock(proof : Int64, previousHash : String = nil)
        blockHash = previousHash ||  hashBlock chain[chain.size - 1]

        block = Block.new chain.size + 1, Time.utc_ticks, currentTransactions, proof, previousHash
        currentTransactions = [] of Transaction

        chain << block
        block
    end
    
    # Add a new transaction that will go in the next mined block
    # Returns the index of the block that this transaction will be added to
    def addTransaction(sender : String, recipient : String, amount : Int32) : Block
        currentTransactions << Transaction.new sender, recipient, amount

        lastBlock.index + 1
    end

    def lastBlock : Block
        chain[chain.size - 1]
    end

    # How to make this static in Crystal???
    def hashBlock(block : Block) : String
        hash = OpenSSL::Digest.new("SHA256")
        hash.update block.to_s
        hash.hexdigest
    end
end
