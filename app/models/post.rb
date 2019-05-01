class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction, Non-Fiction)}
  validates :is_clickbaity(post)

  def is_clickbaity(post)
    unless post.title.match?("Won't believe") || post.title.match?('Secret') || post.title.match?('Top[number]') || post.title.match?('Guess')
      post.errors << 'must be clickbait'
    end
  end
end
