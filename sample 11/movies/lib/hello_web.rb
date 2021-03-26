require 'sinatra'
require "sinatra/reloader"
get('/') do
  'Hello, web!'
end

get('/hello') do
  'Hello, web!'
end

get('/salut') do
  'Salut web!'
end

get('/namaste') do
  'Namaste, web!'
end

