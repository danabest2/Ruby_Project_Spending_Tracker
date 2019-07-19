require_relative('../db/sql_runner')

class Spending_type

  attr_reader :id
  attr_accessor :type

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
  end


  def save()
      sql = "INSERT INTO spending_types
      (
        type
      )
        VALUES
      (
        $1
      )
      RETURNING id"
      values = [@type]
      result = SqlRunner.run(sql, values)
      id = result.first["id"]
      @id = id.to_i
  end

  def self.all()
      sql = "SELECT * FROM spending_types"
      spending_types = SqlRunner.run(sql)
      result = spending_types.map{ |spending_type|  Spending_type.new(spending_type) }
      return result
    end

  def update()
        sql = "UPDATE spending_types SET (type) = ($1) WHERE id = $2"
        values = [@type, @id]
        SqlRunner.run(sql, values)
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
