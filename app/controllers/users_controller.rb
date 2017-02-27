class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if  @user.save
      redirect_to @user
    else
      flash[:notice] = 'Dado inválido'
      render :new
    end

    def show
      @user = User.find(params[:id])
    end

  end


  private

  def users_params
  params.require(:user).permit(:name, :email, :encrypted_password,
                              :administrator)
  end

end
