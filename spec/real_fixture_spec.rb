require "#{File.dirname __FILE__}/../app/post_repository.rb"
require "#{File.dirname __FILE__}/../app/post.rb"

describe PostRepository, "#popular" do
  it "should return all popular posts" do
    popular_posts = (1..2).map { build_popular_post }
    unpopular_posts = (1..3).map { build_unpopular_post }
    posts = (popular_posts + unpopular_posts).shuffle
    repository = PostRepository.new posts

    actual = repository.popular 

    actual.should have(2).posts
    actual.should include(popular_posts.first, popular_posts.last)
  end

  def build_unpopular_post
    build_post PopularityCalculator::THRESHOLD
  end

  def build_popular_post
    build_post PopularityCalculator::THRESHOLD + 1
  end

  def build_post(comment_count)
    post = Post.new 'post text', 'author id'
    comment_count.times { post.add_comment Comment.new('comment text', post) }
    post
  end
end
