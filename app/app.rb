ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'data_mapper'
require_relative './models/link.rb'


class Manager < Sinatra::Base

  get '/links' do
    @link = Link.all
    erb :links
  end

  get '/links/new' do
    erb(:new)
  end

  post '/links' do
    Link.create(title: params[:title], url: params[:url])
    redirect '/links'

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
