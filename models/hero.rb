class Hero

  def initialize( options )
      @id = options['id'].to_i if options
      @name =  options['name']
      @animal_collection = options['animal_collection'] #or is this an empty array
      # or define it that way below in a method?

  end



end
