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

  def get_date
    date = DateTime.strptime(datetime, "%d/%m/%y %R")
    date.to_date
    date.strftime("%d/%m/%Y")
  end

  def get_time
    time = DateTime.strptime(datetime, "%d/%m/%y %R")
    time.to_date
    time.strftime("%R")
  end
end
