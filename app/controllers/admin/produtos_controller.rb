class Admin::ProdutosController <Admin::BaseController

  before_filter :carregar_produto, :only => [:new, :edit, :create, :update]

  def index
  	@produtos = paginar( Produto )
  end

  def new 
  	reder :new
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
  
  protected

  def carregar_produto
    @produto = if params params[:id].blank?
      Produto.new
    else
      @produto.find(params[:id])
    end
   end


end