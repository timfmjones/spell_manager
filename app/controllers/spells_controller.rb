class SpellsController < ApplicationController
  def index
      @spells = Spell.all
  end

  def create
    @spell = Spell.new(spell_params)

    if @spell.save
      flash[:notice] = 'Spell was successfully created.'  
      redirect_to @spell
    else
      render :new
    end
  end

  def new
      @spell = Spell.new
  end

  def edit
      @spell = Spell.find(params[:id])
  end

  def show
      @spell = Spell.find(params[:id])
  end

  def update
    @spell = Spell.find(params[:id])  
    if @spell.update(spell_params)
      flash[:notice] = 'Spell was successfully updated.' 
      redirect_to @spell
    else
      render :edit
    end
  end

  def destroy
    @spell = Spell.find(params[:id])  
    ActiveRecord::Base.connection.execute("Delete from spells where spells.id = #{@spell.id}")
    ActiveRecord::Base.connection.execute("Delete from book_spell where book_spell.spell_id = #{@spell.id}")
    
    redirect_to spells_url 
  end
    
    
  def addToBook
    @books = Book.all  
    @spell = Spell.find(params[:id])
    @bk 
    #addSpellToBook(@bk.id)
      
  end
    
  private
    # Only allow a trusted parameter "white list" through.
    def spell_params
      # params is a hashtable.  It should have in it a key of :author.
      # The value for the :author key is another hash.
      # If params does not contain the key :author, an exception is raised.  
      # Only the "author" hash is returned and only with the permitted key(s).
      params.require(:spell).permit(:name)
    end
end
