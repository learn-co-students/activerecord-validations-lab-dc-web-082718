class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :clickbait


  def clickbait
    clickbaits = [/Won't Believe/, /Secret/, /Top \d/, /Guess/]

    if clickbaits.any? {|clickbait| clickbait.match self[:title]}
      return true
    else
      errors.add(:title, "not a clickbait")
      return false
    end
  end

end
