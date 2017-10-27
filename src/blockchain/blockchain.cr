require "./block"
require "./transaction"

class Blockchain
    private chain : Array
    private currentTransactions : Array
    
    def initialize
        chain = [] of Block
        currentTransactions = [] of Transaction
    end

    def addBlock(block : Block)
        chain << block
    end

    def addTransaction(transaction : Transaction)
        currentTransactions << transaction
    end

    def lastBlock
        chain[-1]
    end

    def self.hash(block : Block)
        puts "TODO: Hash a block"
    end
end
