require_relative( '../db/sql_runner' )

class Animal

def initialize( options )
  @id = options['id'].to_i if options['id']
  @species = options['name']
  @adoption_month = options['type'] #date or integer
  @adoptable =  options['adoptable'] #boolean
end


end
