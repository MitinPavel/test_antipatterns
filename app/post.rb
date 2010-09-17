require "#{File.dirname __FILE__}/comment.rb"

class Post
  def initialize(text, author_id)
    @text = text
    @author_id = author_id
    @comments = []
  end

  def add_comment(text)
    @comments << Comment.new(text, self)
  end

  def comment_count
    @comments.size
  end
end
