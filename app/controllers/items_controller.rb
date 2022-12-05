class ItemsController < ApplicationController
  before_action :move_to_index, only: [:edit]

  def index
  end

  def new
    @item = Item.new
  end  

  def create
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end  
  
  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :item_status_id, :shopping_cost_id, :prefecture_id, :shopping_date_id, :price, :image).merge(user_id: current_user.id)
  end  

end
