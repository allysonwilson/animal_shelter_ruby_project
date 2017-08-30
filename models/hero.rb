require_relative( '../db/sql_runner' )

class Hero

attr_reader( :id , :name, :image )
  def initialize( options )
      @id = options['id'].to_i if options
      @name =  options['name']
      @image = options['image']

  end

  def save()
      sql = "INSERT INTO heroes
      ( name , image  )
      VALUES
      ($1 , $2)
      RETURNING id"
      values = [ @name , @image ]
      results = SqlRunner.run(sql, values)
      @id = results.first()[ 'id' ].to_i
    end

    def self.all()
      sql = "SELECT * FROM heroes"
      values = []
      results = SqlRunner.run( sql, values )
      return results.map { |hash| Hero.new( hash ) }
    end

    def self.find( id )
      sql = "SELECT * FROM heroes
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run( sql, values )
      return Hero.new( results.first )
    end

    def self.delete_all
      sql = "DELETE FROM heroes"
      values = []
      SqlRunner.run( sql, values )
    end



end
