ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

  configure :development do
    enable :logging, :dump_errors, :raise_errors
    disable :show_exceptions
    DataMapper::Logger.new(STDOUT, :debug, '[DataMapper] ')
    DataMapper::Model.raise_on_save_failure = true
  end

  configure :test do
    enable :dump_errors, :raise_errors
    disable :run, :logging, :show_exceptions
  end

  get '/links' do
    @links = Link.all
    erb :'/links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end
end
