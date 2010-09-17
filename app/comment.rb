class Comment
  attr_reader :post

  def initialize(text, post)
    @text, @post = text, post
  end
end
