require 'sinatra/base'
require './lib/bookmark'
require 'pry'

class BookmarkManager < Sinatra::Base
  enable :method_override
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @list = Bookmark.all
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :add
  end

  post '/bookmarks/new' do
    Bookmark.create(params[:title], params[:url])
    redirect "/bookmarks"
  end

  delete '/bookmarks/:id' do
     Bookmark.delete(params[:id])
     redirect '/bookmarks'
  end

  get '/bookmarks/:id/update' do
    @bookmark = Bookmark.find(params[:id])
    erb(:update)
  end

  patch '/bookmarks/:id' do
    Bookmark.update(params[:id], params[:title], params[:url])
    redirect 'bookmarks'
  end
  run! if app_file == $0
end
