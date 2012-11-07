require 'sinatra'
require "json"

unless File.exist?('./public/booth')
  puts 'Create booth:'
  puts "run the following command and then rerun the app"
  puts 'ln -s ~/Pictures/Photo\ Booth\ Library/Pictures ./public/booth'
  exit
end

get '/images' do
  image_array = []
  Dir.foreach("./public/booth") do |element|
    image_array << element
  end
  image_array.delete(".")
  image_array.delete("..") 
  json image_array
end

get '/random_images' do
  image_array = []
  Dir.foreach("./public/booth") do |element|
    image_array << element
  end
  image_array.delete(".")
  image_array.delete("..") 
  image_array.shuffle!
  image_array
  
end
