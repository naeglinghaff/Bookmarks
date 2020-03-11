# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :method_override

  get '/bookmarks' do
    # calls the class method all on bookmark
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :new
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    p Bookmark.all
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect 'bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
