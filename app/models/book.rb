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
    
  def s_in_b
     
      #s = Spellsbook.where(book_id: self.id).pluck(:spell_id)
      s = []
      s = ActiveRecord::Base.connection.execute("select spells.name from (spells
inner join book_spell on book_spell.spell_id = spells.id)
where book_spell.book_id = #{self.id}")
      return s
  end
    
  
    
    
end


