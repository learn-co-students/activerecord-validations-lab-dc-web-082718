class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
    validate :must_be_clickbait

    def must_be_clickbait
      if !title.nil?
        if !title.include?("Won't Believe"||"Secret"||"Top"||"Guess")
          errors.add(:title, "Isn't clickbait")
        end
      end
    end

end
