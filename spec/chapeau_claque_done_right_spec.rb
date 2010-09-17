require "#{File.dirname __FILE__}/../app/popularity_calculator.rb"
require "#{File.dirname __FILE__}/../app/post.rb"

describe PopularityCalculator, "#popular?" do
  THRESHOLD = PopularityCalculator::THRESHOLD

  it "should return true if the comment count \
      is more then the popularity threshold" do
    post = post_with_comment_count THRESHOLD + 1
    subject.popular?(post).should be_true

    post = post_with_comment_count THRESHOLD + 100
    subject.popular?(post).should be_true
  end

  it "should be false if the comment count /
      is less than or equal to the popularity threshold" do
    post = post_with_comment_count THRESHOLD 
    subject.popular?(post).should be_false

    post = post_with_comment_count THRESHOLD - 1
    subject.popular?(post).should be_false
  end
  
  def post_with_comment_count(comment_count)
    post = Post.new 'post text', 'author_id'
    comment_count.times { post.add_comment 'comment text' }
    post
  end
end
