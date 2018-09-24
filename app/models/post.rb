class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 150}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

  @@clickbait = [
    /Won't Believe/,
    /Secret/,
    /Top \d+/,
    /Guess/
  ]

  def is_clickbait?
    @@clickbait.each do |bait|
      if bait.match(self.title)
        return true
      end
    end
    errors.add(:title, "must be clickbait")
    return false
  end
end
