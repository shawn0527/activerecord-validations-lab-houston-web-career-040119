class MyValidator < ActiveModel::Validator
  def validate(post)
    unless post.title.match?('Secret') || post.title.match?('Top[number]') || post.title.match?('Guess')
      post.errors[:title] << 'Wrong'
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction, Non-Fiction)}
  include ActiveModel::Validations
  validates_with MyValidator
end
