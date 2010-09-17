require "#{File.dirname __FILE__}/popularity_calculator.rb"

class PostRepository
  def initialize(posts)
    @posts = posts
  end

  def popular
    @posts.select { |p| PopularityCalculator.new.popular? p }
  end
end
