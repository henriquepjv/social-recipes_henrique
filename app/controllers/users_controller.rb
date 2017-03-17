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
  end

    def show
      @user = User.find(params[:id])
    end

    def update
      if @recipe.update recipe_params
        redirect_to @recipe
      else
        render 'Editar'
      end
    end


  private

  def users_params
  params.require(:user).permit(:email, :password)
  end

end
