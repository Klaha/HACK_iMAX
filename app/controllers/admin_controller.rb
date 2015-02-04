class AdminController < LoginController
  before_action :path_role_login # INDICA EL PATH PARA REDIRECCIONAR SI EL LOGIN ES FALLIDO, y el role de usuario para verificar
  before_action :require_login # VERIFICA USUARIO LOGEADO
  def index
  end



  private
  def path_role_login
    @path ||= login_path
    @role = "A"
  end
end
