class Book < ApplicationRecord
  has_and_belongs_to_many :spells
    
  validates_presence_of :name
  validates_length_of :name, maximum: 70
    
  def self.to_nested_array_for_select
    nested = []  
    Book.order(:name).each do |book|         
        nested.push [book.name, book.id]
    end
    return nested 
  end
end