require "./transaction"

class Block
    property index : Int32
    property timestamp : Float64
    property transactions = [] of Transaction
    property proof : Int64
    property previousHash : String

    def initialize(@index, @timestamp, @transactions, @proof, @previousHash)
    end

    def addTransaction(transaction : Transaction)
        @transactions << transaction
    end

    def addTransactions(transactions : Array)
        @transactions = @transactions + transactions
    end
end
