class AdminController < LoginController
  before_action :path_role_login # INDICA EL PATH PARA REDIRECCIONAR SI EL LOGIN ES FALLIDO, y el role de usuario para verificar
  before_action :require_login # VERIFICA USUARIO LOGEADO
  def index
  end

  def price
    @settings = Setting.take
  end

  def update_price
    @settings = Setting.take
    @settings.price_ticket_type_1 = params[:setting][:price_ticket_type_1]
    @settings.save
    redirect_to admin_price_path
  end

  private
  def path_role_login
    @path ||= login_path
    @role = "A"
  end
end
