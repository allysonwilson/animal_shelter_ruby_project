class Hero

  def initialize( options )
      @id = options['id'].to_i if options
      @name =  options['name']
      
  end

  def save()
      sql = "INSERT INTO heros
      (
        name,

      )
      VALUES
      (
        $1, $2
      )
      RETURNING id"
      values = [@name, @type]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
    end

    def self.all()
      sql = "SELECT * FROM heros"
      values = []
      results = SqlRunner.run( sql, values )
      return results.map { |hash| Hero.new( hash ) }
    end

    def self.find( id )
      sql = "SELECT * FROM heros
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run( sql, values )
      return Hero.new( results.first )
    end

    def self.delete_all
      sql = "DELETE FROM heros"
      values = []
      SqlRunner.run( sql, values )
    end



end
