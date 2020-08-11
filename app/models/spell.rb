class Spell < ApplicationRecord
    has_and_belongs_to_many :books
    
    validates_presence_of :name
    validates_length_of :name, maximum: 70
    
    validates_presence_of :level;
    validates_numericality_of :level, only_integer: true, greater_than: -1, less_than: 10
   
    validates_presence_of :school
    validates :school, inclusion: { in: %w(Conjuration Necromancy Evocation Abjuration Transmutation Divination Enchantment Illusion),
    message: "must be Conjuration, Necromancy, Evocation, Abjuration, Transmutation, Divination, Enchantment, or Illusion" }
    
    validates :concentration, inclusion: { in: %w(Yes No),
    message: "must be yes or no" }
    
    validates_length_of :description, maximum: 4096
    
    
    def self.to_nested_array_for_select
     nested = []  
     Spell.order(:level,:name).each do |spell|
         
         nested.push [spell.name, spell.id]
     end
     return nested 
    end
end
