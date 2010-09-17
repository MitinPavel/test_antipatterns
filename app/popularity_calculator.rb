class PopularityCalculator
  THRESHOLD = 10

  def popular?(post)
    THRESHOLD < post.comment_count
  end
end
