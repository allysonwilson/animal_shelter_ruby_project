require_relative('../db/sql_runner')

class Adoption
    attr_reader( :hero_id, :animal_id, :id )

def initialize(options)
  @id = options[id].to_i if options['id']
  @hero_id = options['hero_id'].to_i
  @animal_id = options['animal_id'].to_i
end

def save()
    sql = "INSERT INTO adoptions
    (
      hero_id,
      animal_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@hero_id, @animal_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM adoptions"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map { |adoption| Adoption.new( adoption ) }
  end

  def animal()
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [@animal_id]
    results = SqlRunner.run( sql, values )
    return Animal.new( results.first )
  end

  def hero()
    sql = "SELECT * FROM heroes
    WHERE id = $1"
    values = [@hero_id]
    results = SqlRunner.run( sql, values )
    return Hero.new( results.first )
  end

  def self.delete_all()
    sql = "DELETE FROM adoptions"
    values = []
    SqlRunner.run( sql, values )
  end

  def self.destroy(id)
    sql = "DELETE FROM adoptions
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def update()
    sql = "UPDATE adoptions
    SET
    (
    hero_id,
    animal_id
    )=
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@hero_id, @animal_id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM adoptions
    WHERE ID = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    adoption = Adoption.new(result)
    return adoption
  end
end
