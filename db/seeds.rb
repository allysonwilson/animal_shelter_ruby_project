require_relative( '../models/hero.rb' )
require_relative( '../models/animal.rb' )
require_relative( '../models/adoption.rb' )


Adoption.delete_all()
Hero.delete_all()
Animal.delete_all()

hero1 = Hero.new({
  'name' => 'Ona',
  'image'=> '/images/Ona_avatar.png'
  })
hero1.save()

hero2 = Hero.new({
  'name' => 'Granny',
  'image'=> '/images/Granny.png'
  })
hero2.save()

hero3 = Hero.new({
  'name' => 'Joe',
  'image'=> '/images/Fraser_avatar.png'
  })
hero3.save()


animal1 = Animal.new({
'species' => 'Basking Shark',
'adoption_month' => 'August',
'adoptable' => 't',
'image' => '/images/basking_shark_cartoon.jpeg'
})
animal1.save()


animal2 = Animal.new({
  'species' => 'Golden Oriole',
  'adoption_month' => 'September',
  'adoptable' => 'f',
  'image' => '/images/goldfinch.jpg'
})
animal2.save()

animal3 = Animal.new({
  'species' => 'Adder',
  'adoption_month' => 'July',
  'adoptable' => 'f',
  'image' => '/images/adder.jpg'
})
animal3.save

adoption1 = Adoption.new({
  'animal_id' => animal1.id,
  'hero_id' => hero1.id
})
adoption1.save()
