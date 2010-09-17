require "#{File.dirname __FILE__}/../app/post_repository.rb"
require "#{File.dirname __FILE__}/../app/post.rb"

describe PostRepository, "#popular" do
  it "should return a popular post" do
    post = build_popular_post
    repository = PostRepository.new [post]
    repository.popular.should include(post)
  end

  it "shouldn't return an unpopular post" do
    post = build_unpopular_post
    repository = PostRepository.new [post]
    repository.popular.should_not include(post)
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
