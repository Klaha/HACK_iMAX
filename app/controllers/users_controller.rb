class UsersController < LoginController

  def new
    @user = User.new
    @path = registro_path
  end

  def create
    @user = User.new(user_params)
    @user.role='C'
    if @user.email.empty? || @user.password.empty? || @user.ci.to_s.empty? || @user.name.empty?
      redirect_to registro_path, notice: 'Error en el formulario'
    else

      if @user.email==params['user_verify'][:email] &&
          @user.password==params['user_verify'][:password] &&
          @user.valid?

        @user.save
        redirect_to root_path, notice: 'Usuario creado exitosamente'
        return
      else
        redirect_to registro_path, notice: 'Error en el formulario'
        return
      end


    end
  end

  def login #formulario login
    current_user #seteando current user
    if !@_current_user.nil?
      redirect_to root_path, notice: 'Seccion ya iniciada con ' + @_current_user.name
    end
  end

  def create_session
    user = User.authenticate(user_params)
    if !user.nil?
      session[:current_user_id] = user.id
      if  user.role == "C"
        # Save the user ID in the session so it can be used in
        # subsequent requests
        redirect_to root_path, notice: "Has iniciado seccion como " + user.name
      else
        if user.role == "E"
          redirect_to employee_path, notice: "Has iniciado seccion como " + user.name
        else
          redirect_to admin_path, notice: "Usuario Admin..."
        end
      end
    else
      redirect_to login_path, notice: "fallo al iniciar seccion"
    end

  end

  def destroy_session #terminando session
    # Remove the user id from the session
    @_current_user = session[:current_user_id] = nil
    redirect_to root_path
  end

  private
  def user_params
    # params.require(:show).permit(:movie_id,:time,:theater_id)
    params.require(:user).permit(:name,:email,:password,:ci)
  end

end

