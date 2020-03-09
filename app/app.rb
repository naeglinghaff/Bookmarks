require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/bookmarks' do
    @bookmark = Bookmark.new
    @bookmark_list = @bookmark.all
    erb :index
  end

  run! if app_file == $0
end
