class Onduleur < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Onduleur.create! row.to_hash
    end
  end

  def self.total_onduleur
    onduleur = []
    Onduleur.all.each do |o|
      onduleur << o.energy
    end
    onduleur.inject(:+)
  end
end
