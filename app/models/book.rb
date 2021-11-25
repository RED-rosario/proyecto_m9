class Book < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :categories

  validates  :title, :description, presence: :true

  after_create :save_categories
  
  #Custom setter
  def categories=(value)
    @categories = Category.where(id: value.map {|v| v.to_i})
  end

  private
  def save_categories
    #@categories.each do |category_id|
      self.categories << @categories
      #JoinTable.create(category_id: category_id,book_id: self.id)
    #end
  end
end 
