require_relative( '../db/sql_runner' )

class Animal

  attr_reader( :species, :adoption_month, :adoptable, :id )

def initialize( options )
  @id = options['id'].to_i if options['id']
  @species = options['name']
  @adoption_month = options['type'] #date or integer
  @adoptable =  options['adoptable'] #boolean
end


end
