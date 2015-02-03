class UsersController < ApplicationController
  def new
    @user = User.new
    @path = registro_path
  end

  def create
    @user = User.new(user_params)
    @user.role='C'
    if @user.email.empty? || @user.password.empty? || @user.ci.to_s.empty? || @user.name.empty?
      redirect_to registro_path, notice: 'Error en el formulario'
      return

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

  private
  def user_params
    # params.require(:show).permit(:movie_id,:time,:theater_id)
    params.require(:user).permit(:name,:email,:password,:ci)
  end
end

