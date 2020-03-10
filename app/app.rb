# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/bookmarks' do
    # calls the class method all on bookmark
    @bookmark_list = Bookmark.all
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end
