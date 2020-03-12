class Comment

  attr_reader :id, :comment, :bookmark_id

  def initialize(id:, comment:, bookmark_id:)
    @id = id
    @comment = comment
    @bookmark_id = bookmark_id
  end

  def self.create(comment:, bookmark_id:)
    result = DatabaseConnection.query("INSERT INTO comments (text, bookmark_id) VALUES('#{comment}', '#{bookmark_id}') RETURNING id, text, bookmark_id")
    Comment.new(id: result[0]["id"], comment: result[0]["text"], bookmark_id: result[0]["bookmark_id"])
  end

end
