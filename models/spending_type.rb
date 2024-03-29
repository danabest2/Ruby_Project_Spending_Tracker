require_relative('../db/sql_runner')

class Spending_type

  attr_accessor :tag
  attr_reader :id

options = [@id, @tag]

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @tag = options['tag']
  end


  def save()
      sql = "INSERT INTO spending_types
      (
        tag
      )
        VALUES
      (
        $1
      )
      RETURNING id"
      values = [@tag]
      result = SqlRunner.run(sql, values)
      id = result.first["id"]
      @id = id.to_i
  end

  def merchants()
      sql = "SELECT merchants.*
      FROM merchants
      INNER JOIN transactions
      ON transactions.merchant_id = merchant.id
      WHERE transactions.spending_type_id = $1"
      values = [@id]
      merchant_data = SqlRunner.run(sql, values)
      merchants = Merchant.map_items(merchant_data)
      return merchants
  end

  def self.all()
      sql = "SELECT * FROM spending_types"
      spending_types = SqlRunner.run(sql)
      result = spending_types.map{ |spending_type| Spending_type.new(spending_type) }
      return result
    end

  def update()
        sql = "UPDATE spending_types SET tag = $1 WHERE id = $2"
        values = [@tag, @id]
        SqlRunner.run(sql, values)
  end


  def self.find(id)
      sql = "SELECT * FROM spending_types
      WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql, values).first
      spending_type = Spending_type.new(result)
      return spending_type
  end


  def self.delete_all()
        sql = "DELETE FROM spending_types"
        values = []
        SqlRunner.run(sql, values)
  end

  def delete()
      sql = "DELETE FROM spending_types
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
  end

end
