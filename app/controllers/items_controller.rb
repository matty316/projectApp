class ItemsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @item = @user.items.create(item_params)
    redirect_to @user
  end

  private
    def item_params
      params.require(:item).permit(:title, :description, :store)
    end
end
