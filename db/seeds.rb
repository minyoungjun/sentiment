# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
require 'open-uri'

docs = open(Rails.root.join("db", "wordval.txt")).readlines

docs.each do |doc|
  word = Wordval.new
  arr = doc.split(",")
  word.content = arr[0].to_s
  word.score = arr[1].to_i
  word.save

end


