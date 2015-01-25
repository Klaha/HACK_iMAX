class EmployeeController < LoginController
  before_action :path_role_login # INDICA EL PATH PARA REDIRECCIONAR SI EL LOGIN ES FALLIDO, y el role de usuario para verificar
  before_action :require_login # VERIFICA USUARIO LOGEADO
  skip_before_action :require_login, only: [:login,:create_session] # NO VA A VERIFICAR USUARIO LOGEADO EN ESTAS ACCIONES
  def index
  end

  def login #formulario login
  end

  def create_session #generando cookies de login
    if user = User.authenticate(user_params)
      if  user.role == "E"
        # Save the user ID in the session so it can be used in
        # subsequent requests
        session[:current_user_id] = user.id
        redirect_to employee_path, notice: "Has iniciado seccion como " + user.name
      else
        redirect_to employee_login_path, notice: "Usuario no Empleado"
      end
    else
      redirect_to employee_login_path, notice: "fallo al iniciar seccion"
    end

  end

  def destroy #terminando session
    # Remove the user id from the session
    @_current_user = session[:current_user_id] = nil
    redirect_to employee_login_path
  end

  private
  def user_params
    # movie_id
    # time
    # date_show
    params.require(:user).permit(:email,:password)
  end

  def path_role_login
    @path ||= employee_login_path
    @role = "E"
  end
end
