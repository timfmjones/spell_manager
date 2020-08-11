class AddReferencesToSpellsBooks < ActiveRecord::Migration[6.0]
  def change
      
       add_foreign_key :book_spell, :books, column: :book_id, primary_key: "id"      
       add_foreign_key :book_spell, :spells, column: :spell_id, primary_key: "id"                  
 
  end
end
