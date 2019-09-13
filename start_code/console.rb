require_relative('models/casting')
require_relative('models/movie')
require_relative('models/star')

require('pry-byebug')

Movie.delete_all()
Star.delete_all()
Casting.delete_all()


movie1 = Movie.new({
  'title' => 'La La Land',
  'genre' => 'musical',
  'budget' => 30000000
})

movie1.save()


movie2 = Movie.new({
  'title' => 'Gangster Squad',
  'genre' => 'action crime',
  'budget' => 75000000
})

movie2.save()

movie3 = Movie.new({
  'title' => 'Crazy Stupid Love',
  'genre' => 'romantic comedy',
  'budget' => 50000000
})

movie3.save()

star1 = Star.new({
  'first_name' => 'Emma',
  'last_name' => 'Stone'
})

star1.save()


star2 = Star.new({
  'first_name' => 'Ryan',
  'last_name' => 'Gosling'
})

star2.save()

star3 = Star.new({
  'first_name' => 'Nick',
  'last_name' => 'Nolte'
})

star3.save()

casting1= Casting.new(
  {
  'movie_id' => movie1.id,
  'star_id' => star1.id,
  'fee'=> 100000
  }
)
casting1.save()

casting2= Casting.new(
  {
  'movie_id' => movie2.id,
  'star_id' => star2.id,
  'fee'=> 500000
  }
)
casting2.save()

binding.pry
nil
