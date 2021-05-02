# General Class intended to have all helper functions to load needed assets
class Loader
  ARTS_PATH = File.join('db', 'seed', 'arts')

  def self.ascii_model(name)
    File.read(File.join(ARTS_PATH, name))
  end

  def self.db_ascii_model(model, name)
    model.find_by(name: name).ascii_model
  end
end