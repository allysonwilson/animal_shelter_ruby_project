require_relative( '../db/sql_runner' )

class Animal

  attr_reader( :species, :adoption_month, :adoptable, :id )

def initialize( options )
  @id = options['id'].to_i if options['id']
  @species = options['name']
  @adoption_month = options['type'] #date or integer
  @adoptable =  options['adoptable'] #boolean
end

def save()
  sql = "INSERT INTO animals
  (
    name,
    run_speed
  )
  VALUES
  (
    $1, $2
  )
  RETURNING id"
  values = [@name, @run_speed]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
end

def self.all()
  sql = "SELECT * FROM animals"
  values = []
  results = SqlRunner.run( sql, values )
  return results.map { |animal| Animal.new( animal ) }
end

def self.find( id )
  sql = "SELECT * FROM animals
  WHERE id = $1"
  values = [id]
  results = SqlRunner.run( sql, values )
  return Animal.new( results.first )
end

def self.delete_all
  sql = "DELETE FROM animals"
  values = []
  SqlRunner.run( sql, values )
end

end
