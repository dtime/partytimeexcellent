require 'sinatra'

unless File.exist?('./public/booth')
  puts 'Create booth:'
  puts 'ln -s ~/Pictures/Photo\ Booth\ Library/Pictures ./public/booth'
  exit
end

get '/images' do
  
end
