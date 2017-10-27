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
        @hashGen = OpenSSL::Digest.new("SHA256")

        # Genesis block
        addBlock 100_i64, "1"
    end

    # Add a block to the end of the block
    # Returns the new block
    def addBlock(proof : Int64, previousHash : String = nil)
        blockHash = previousHash ||  hashBlock lastBlock

        block = Block.new chain.size + 1, Time.utc_ticks, currentTransactions, proof, previousHash
        @currentTransactions = [] of Transaction

        @chain << block
        block
    end
    
    # Add a new transaction that will go in the next mined block
    # Returns the index of the block that this transaction will be added to
    def addTransaction(sender : String, recipient : String, amount : Int32) : Block
        @currentTransactions << Transaction.new sender, recipient, amount

        lastBlock.index + 1
    end

    def lastBlock : Block
        @chain[@chain.size - 1]
    end

    # How to make this static in Crystal???
    def hashBlock(block : Block) : String
        @hashGen.update block.to_s
        @hashGen.hexdigest
    end

    # Find a number p such that hash(p * p') has 4 leading zeroes
    # p is previous proof, p' is new proof
    def proofOfWork(lastProof : Int64)
        proof = 0_i64

        until validProof lastProof proof
            proof += 1
        end

        proof
    end

    # Validates proof by checking if hash(lastProof * proof) has 4 leading zeroes
    def validProof(lastProof : Int64, proof : Int64) : Bool
        guess = "#{lastProof * proof}".encode
        @hashGen.update guess
        hashedGuess = @hashGen.hexdigest

        hashedGuess[0, 4] == "0000"
    end
end
