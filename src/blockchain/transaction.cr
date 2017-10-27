class Transaction
    property sender : String
    property recipient : String
    property amount : Int32

    def initialize(@sender, @recipient, @amount)
    end
end
