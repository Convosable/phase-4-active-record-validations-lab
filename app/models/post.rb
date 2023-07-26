class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }

    validate :clickbait?

    #regex patterns for clickbait?
    

    def clickbait?
        
        clickbait_patterns = [
            /Won't Believe/i,
            /Secret/i,
            /Top \d/i,
            /Guess/i
        ]

        if clickbait_patterns.any? { |pattern| pattern.match title}
        else
            errors.add(:title, "must be clcikbait")
        end
    end


end
