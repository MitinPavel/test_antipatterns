require "#{File.dirname __FILE__}/../app/popularity_calculator.rb"
require "#{File.dirname __FILE__}/../app/post.rb"

describe PopularityCalculator, "#popular?" do
  it "should take into account the comment count" do
    post = post_with_comment_count 11
    expected = PopularityCalculator::THRESHOLD < post.comment_count
    actual = subject.popular? post
    actual.should == expected
  end


  def post_with_comment_count(comment_count)
    post = Post.new 'post text', 'author_id'
    comment_count.times { post.add_comment 'comment text' }
    post
  end
end
