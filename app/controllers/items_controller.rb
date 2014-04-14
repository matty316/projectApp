class ItemsController < ApplicationController
  before_action :signed_in_user, only: [:create]
  before_action :correct_user,   only: [:create]

  def create
    @user = User.find(params[:user_id])
    @item = @user.items.create(item_params)
    redirect_to @user
  end

  private
    def item_params
      params.require(:item).permit(:title, :description, :store)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
