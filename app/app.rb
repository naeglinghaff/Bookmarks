# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark'
require 'sinatra/flash'
require 'uri'
require_relative './database_connection_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/bookmarks' do
    # calls the class method all on bookmark
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :new
  end

  post '/bookmarks' do
    flash[:notice] = "You must submit a valid URL." unless Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect 'bookmarks'
  end

  patch '/bookmarks/:id' do
    flash[:notice] = "You must submit a valid URL." unless Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect('/bookmarks')
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :edit
  end

  run! if app_file == $PROGRAM_NAME
end
