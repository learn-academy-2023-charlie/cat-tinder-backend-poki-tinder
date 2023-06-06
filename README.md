 <!-- COMMANDS
 
rails new poki-tinder-backend -d postgresql -T
ls
cd poki-tinder-backend
rails db:create
bundle add rspec-rails
rails generate rspec:install
git remote add origin https://github.com/learn-academy-2023-charlie/cat-tinder-backend-poki-tinder.git
git branch -M main\n
gst
git checkout -b main
git add .
git commit -m "setting up main"
git push origin main
rails server
git checkout -b backend-structure
rails generate resource Pokemon name:string species:string size:decimal sound:string image:text
rails db:migrate
code .
rspec spec
rails db:seed 
rails generate migration AddTypeToPokemons type:string
rails db:migrate
rails db:seed
rails generate migration AddPokemonTypeToPokemons pokemon_type:string
rails db:migrate
rails db:seed
rails db:rollback
change what you want to change in the migrations file created by the rollback, easy and simple
rails db:migrate
rails db:seed
bundle
rails db:migrate

-->

<!-- first blocker, we forgor to add a 'type' column for our pokemons
solved by using migrations add_column -->
<!-- second blocker, 'type' cannot be the name of our column -->
 <!-- ActiveRecord::SubclassNotFound: The single-table inheritance mechanism failed to locate the subclass: 'fire'. This error is raised because the column 'type' is reserved for storing the class in case of inheritance. Please rename this column if you didn't intend it to be used for storing the inheritance class or overwrite Pokemon.inheritance_column to use another column for that information.
/Users/learnacademy/Desktop/poki-tinder-backend/db/seeds.rb:37:in `block in <main>'
/Users/learnacademy/Desktop/poki-tinder-backend/db/seeds.rb:36:in `each'
/Users/learnacademy/Desktop/poki-tinder-backend/db/seeds.rb:36:in `<main>'

Caused by:
NameError: wrong constant name fire
/Users/learnacademy/Desktop/poki-tinder-backend/db/seeds.rb:37:in `block in <main>'
/Users/learnacademy/Desktop/poki-tinder-backend/db/seeds.rb:36:in `each'
/Users/learnacademy/Desktop/poki-tinder-backend/db/seeds.rb:36:in `<main>'

1st attempt to fix : 
rails rename_column(:pokemons, :type, :pokemon_type)

Solution :  did a rails db:rollback , it erases the last modification to the database

then recreated the column we wanted using the command:
rails generate migration AddPokemonTypeToPokemons pokemon_type:string
 
 rails db:seed
 "creating a pokemon {:name=>\"Charmander\", :species=>\"lizard\", :size=>0.6, :sound=>\"char\", :image=>\"https://freepngimg.com/convert-png/117725-charmander-free-hd-image\", :pokemon_type=>\"fire\"}"
"creating a pokemon {:name=>\"Flareon\", :species=>\"flame\", :size=>0.9, :sound=>\"flarr\", :image=>\"https://e7.pngegg.com/pngimages/519/282/png-clipart-pokemon-flareon-flareon-pokemon-games-pokemon-thumbnail.png\", :pokemon_type=>\"fire\"}"
"creating a pokemon {:name=>\"Snorlax\", :species=>\"sleeping pokemon\", :size=>2.1, :sound=>\"snore\", :image=>\"https://shorturl.at/bzGTV\", :pokemon_type=>\"normal\"}"
 

third blocker -> type table is still appearing in our db and as 'nil'
 -->

 <!-- cat-tinder-backend-poki-tinder git:(api-validations) ✗ rspec spec/models/pokemon_spec.rb
F

