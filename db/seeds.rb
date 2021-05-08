# Load All needed models in the databse, in case the game is running for the first time
require 'pry'
require 'require_all'
require_all './app/models'
require './lib/loader'

# Intro Arts
Environment.create(name: 'studio_logo', ascii_model: Loader.ascii_model('main_screen/preload_logo.txt'))
Environment.create(name: 'main_screen', ascii_model: Loader.ascii_model('main_screen/main_screen.txt'))
Environment.create(name: 'game_over', ascii_model: Loader.ascii_model('main_screen/game_over.txt'))
Environment.create(name: 'credits', ascii_model: Loader.ascii_model('main_screen/credits.txt'))
Environment.create(name: 'character_selection_screen',
                   ascii_model: Loader.ascii_model('adventurer/character_selection_screen.txt'))
Environment.create(name: 'weapon_selection_screen',
                   ascii_model: Loader.ascii_model('weapons/weapon_selection_screen.txt'))

# About Screen
Environment.create(name: 'about_screen', ascii_model: Loader.ascii_model('about/about_screen.txt'))

# Load Level Scenes
Dir['db/seed/arts/scenes/*'].each do |path|
  name = File.basename(path, '.*')
  Environment.create(name: name, ascii_model: Loader.ascii_model("scenes/#{name}.txt"))
end

# Load Monsters
Dir['db/seed/arts/monsters/*'].each do |path|
  name = File.basename(path, '.*')
  ascii_model = Loader.ascii_model("monsters/#{name}.txt").split("\n")
  stats = ascii_model.shift.split('!')
  Monster.create(
    name: name,
    ascii_model: ascii_model.join("\n"),
    hp: stats[0].to_i,
    armor: stats[1].to_i,
    damage: stats[2].to_i
  )
end

# Secret Agent character
Character.create(
  name: 'agent',
  ascii_model: Loader.ascii_model('adventurer/secret_agent.txt'),
  intelligence: 80,
  hp: 70,
  armor: 40,
  speed: 50
)

# Armored worrior character
Character.create(
  name: 'samurai',
  ascii_model: Loader.ascii_model('adventurer/samurai.txt'),
  intelligence: 40,
  hp: 90,
  armor: 80,
  speed: 20
)

# assassin character
Character.create(
  name: 'assassin',
  ascii_model: Loader.ascii_model('adventurer/assassin.txt'),
  intelligence: 70,
  hp: 50,
  armor: 20,
  speed: 90
)

# Rifle
Weapon.create(
  name: 'rifle',
  ascii_model: Loader.ascii_model('weapons/rifle.txt'),
  damage: 170,
  attack_speed: 60,
  ranged: true
)

# Katana Sword
Weapon.create(
  name: 'katana',
  ascii_model: Loader.ascii_model('weapons/katana.txt'),
  damage: 120,
  attack_speed: 95,
  ranged: false
)

# Axe
Weapon.create(
  name: 'axe',
  ascii_model: Loader.ascii_model('weapons/axe.txt'),
  damage: 240,
  attack_speed: 40,
  ranged: false
)
