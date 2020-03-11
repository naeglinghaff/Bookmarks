# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/bookmarks' do
    # calls the class method all on bookmark
    @bookmark_list = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :new
  end

  post '/bookmarks' do
    @url = params[:url]
    connection = PG.connect(dbname: 'bookmark_manager_tests')
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{@url}')")
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
