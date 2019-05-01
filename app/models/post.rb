class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction, Non-Fiction)}
  validates :is_clickbaity

  def is_clickbaity
    unless self.title.match?("Won't believe") || self.title.match?('Secret') || self.title.match?('Top[number]') || self.title.match?('Guess')
      self.errors << 'must be clickbait'
    end
  end
end
