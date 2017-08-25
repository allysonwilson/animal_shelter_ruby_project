require( 'pg')

class sql_runner

  def self.run( sql, values)
    begin
      db = PG.connect({ dbname: 'weans_world', host: 'localhost' })
      result = db.exec_prepared( "query", values )
    ensure
      db.close
    end
    return result
  end

end
