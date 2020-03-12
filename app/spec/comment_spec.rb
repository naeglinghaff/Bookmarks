require 'comment'
require 'bookmark'
require 'database_helpers'

describe Comment do
  describe '.create' do
   it 'creates a new comment' do
     bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
     comment = Comment.create(comment: 'This is a test comment', bookmark_id: bookmark.id)

     persisted_data = persisted_data(table: 'comments', id: comment.id )

     expect(comment).to be_a Comment
     expect(comment.id).to eq persisted_data.first['id']
     expect(comment.comment).to eq 'This is a test comment'
     expect(comment.bookmark_id).to eq bookmark.id
   end
 end
end
