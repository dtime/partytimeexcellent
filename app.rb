require 'sinatra'
require "json"

unless File.exist?('./public/booth')
  puts 'Create booth:'
  puts "run the following command and then rerun the app"
  puts 'ln -s ~/Pictures/Photo\ Booth\ Library/Pictures ./public/booth'
  exit
end

get '/images' do
  images_array = []
  images_hash = {}
  Dir.foreach("./public/booth") do |element|
    images_array << element
  end
  images_array.delete(".")
  images_array.delete("..")
  images_hash = {images: images_array}
  images_hash.to_json
end

get '/random_images' do
  images_array = []
  images_hash = {}
  Dir.foreach("./public/booth") do |element|
    images_array << element
  end
  images_array.delete(".")
  images_array.delete("..")
  images_array.shuffle!
  images_hash = {images: images_array}
  images_hash.to_json
end

get '/' do
  File.read(File.join('views', 'index.html'))  #send_file '/views/index.html'
end
