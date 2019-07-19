require_relative('../db/sql_runner')
require_relative("./merchant.rb")
require_relative("./spending_type.rb")

class Transaction

  # attr_reader :id, :value
  attr_accessor :id, :value

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @value = options['value'].to_i
    @spending_type_id = options['spending_type_id'].to_i
    @merchant_id = options['merchant_id'].to_i
  end

  def merchant
        sql = 'SELECT * FROM merchants
        WHERE id = $1'
        values = [@merchant_id]
        merchant = SqlRunner.run(sql, values).first
        return Merchant.new(merchant)
  end


  def spending_type
        sql = 'SELECT * FROM spending_types
              WHERE id = $1'
        values = [@spending_type_id]
        spending_type = SqlRunner.run(sql, values).first
        return Spending_type.new(spending_type)
  end

  def save()
      sql = "INSERT INTO transactions
      (
       value, spending_type_id, merchant_id
       )
        VALUES
      (
        $1, $2, $3
      )
      RETURNING id"
      values = [@value, @spending_type_id, @merchant_id]
      result = SqlRunner.run(sql, values)
      id = result.first["id"]
      @id = id.to_i
  end

  def self.delete_all()
          sql = "DELETE FROM transactions"
          SqlRunner.run(sql)
  end

  def update()
            sql = "UPDATE tickets SET (film_id, customer_id) = ($1, $2) WHERE id = $3"
            values = [@film_id, @customer_id, @id]
            SqlRunner.run(sql, values)
      end

end
