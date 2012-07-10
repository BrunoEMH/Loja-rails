class Admin::ProdutosController <Admin::BaseController

  def index
  	@produtos = paginar( Produto )
  end


end