class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction, Non-Fiction)}
  validates :is_clickbait?

  def is_clickbait?
    if title.none?("Won't believe/") || title.match?('/Secret/') || title.match?('/Top[number]/') || title.match?('/Guess/')
      errors.add(:title, 'must be clickbait')
    end
  end
end
