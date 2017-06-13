class Post < ActiveRecord::Base
  # validates :title, presence: true
  validate  :clickbait
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }


  # def clickbait
  #   needle1 = "Won't Believe"
  #   needle2 = "Secret"
  #   needle3 = "Top 1"
  #   needle4 = "Guess"
  #   if title.include?((needle1) || (needle2) || (needle3) || (needle4))
  #     errors.add(:title, "needs more clickbait!!")
  #     puts needle1
  #   end
  # end

  def clickbait
    arr = ["Won't Believe", "Secret", "Top 1", "Guess" ]
    if self.title && arr.any? { |word| self.title.include?(word) }
      false
    else
      errors.add(:title, "needs more clickbait!!")
    end
  end

end

#try pry, test variables and methods, teset code piece by piece
# talked through tangled spot
#read error


# str = "alo eh tu"
# ['alo','hola','test'].any? { |word| str.include?(word) }
