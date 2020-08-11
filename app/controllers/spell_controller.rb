class SpellController < ApplicationController
  def show
      @spell = Spell.find(params[:id])
  end

  def add
      @spell = Spell.new
  end

  def edit
      @spell = Spell.find(params[:id])
  end

  def delete
  end
    
  def index
      @spells = Spell.all
  end
    
  def update
    @spell = Spell.find(params[:id])  
    if @spell.update(apell_params)
      flash[:notice] = 'Spell was successfully updated.'
      redirect_to @spell
    else
      render :edit
    end
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
