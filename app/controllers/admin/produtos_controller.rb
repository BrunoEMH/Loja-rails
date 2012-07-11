class Admin::ProdutosController <Admin::BaseController

  before_filter :carregar_produto, :only => [:new, :edit, :create, :update, :destroy]

  def index
  	@produtos = paginar( Produto )
  end

  def new 
  	render :new
  end

  alias :edit :new

  
    def create
    
    if @produto.update_attributes(params[:produto])
      flash[:success] = 'O produto foi salvo com sucesso'
      redirect_to admin_produtos_path
    else
      flash.now[:error] =
          'Ocorreram erros na hora de gravar o produto'
      render :new
    end
  end

  alias :update :create

  def destroy
    @produto.destroy
    flash[:success] = 'O produto foi removido com sucesso'
    redirect_to admin_produtos_path
  end
  
  protected

  def carregar_produto
    @produto = if params[:id].blank?
      Produto.new
    else
      Produto.find(params[:id])
    end
   end


end