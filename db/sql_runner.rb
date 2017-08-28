require('pg')

class SqlRunner

  def self.run( sql, values )
    db = PG.connect({ dbname: 'weans_world', host: 'localhost' })
    begin
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close()
    end
    return result
  end

end
