class UsersController < ApplicationController

    def show
      @user = User.find(params[:id])
    end

    def favorite
      @recipes = current_user.favorites
    end

    def unfavorite
      type = params[:type]

      if type == "unfavorite"
        @recipe = Recipe.find(params[:recipe])
        current_user.favorites.delete(@recipe)
        #redirect_to :back, notice: 'Receita excluída dos favoritos'
        redirect_back( fallback_location: (request.referer || root_path), notice: "Receita excluída dos favoritos.")

      end
    end

end
