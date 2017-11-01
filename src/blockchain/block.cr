require "json"
require "./transaction"

class Block
    property index : Int32
    property timestamp : Int64
    property transactions = [] of Transaction
    property proof : Int64
    property previousHash : String

    JSON.mapping({
        index: Int32,
        timestamp: Int64,
        transactions: Array(Transaction),
        proof: Int64,
        previousHash: String
    })

    def initialize(@index, @timestamp, @transactions, @proof, @previousHash)
    end

    def addTransaction(transaction : Transaction)
        @transactions << transaction
    end

    def addTransactions(transactions : Array)
        @transactions = @transactions + transactions
    end
end
