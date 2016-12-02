ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :intro
  end

  get '/users/new' do
    erb(:sign_up)
  end

  post '/users' do
    User.create(email: params[:email], password: params[:password])
    session[:user_id] = User.first(email: params[:email]).id
    session[:user] = params[:email]
    redirect to('/links')
  end

  get '/links' do
    @user = current_user
    @links1 = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    split_tags = params[:tag].split(",").map {|i| i.strip}
    split_tags.each do |tag|
      record = TaggedValue.create(tag: tag)
      link.tagged_value << record
    end
    link.save
    redirect '/links'
  end

  post '/tags' do
    filter_test = TaggedValue.first(:tag => params[:filter_by_tag])
    @links1 = filter_test ? filter_test.links : []
    erb :'links/index'
  end

  helpers do

    def current_user
      @user = User.get(session[:user_id])
    end

  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
