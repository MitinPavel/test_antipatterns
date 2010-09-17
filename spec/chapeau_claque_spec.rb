require "#{File.dirname __FILE__}/../app/popularity_calculator.rb"
require "#{File.dirname __FILE__}/../app/post.rb"

describe PopularityCalculator, "#popular?" do
  it "should take into account the comment count" do
    posts = (0..20).map { |i| post_with_comment_count i }

    posts.each do |post|
      if 10 < post.comment_count
        subject.popular?(post).should be_true
      else
        subject.popular?(post).should be_false
      end
    end
  end

  def post_with_comment_count(comment_count)
    post = Post.new 'post text', 'author_id'
    comment_count.times { post.add_comment 'comment text' }
    post
  end
end
