class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order(id: "DESC")
  end

  def new
    @item = Item.new
  end  

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end  

  def edit
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else  
      render :edit
    end
  end 

  def destroy
    if @item.user = current_user
      @item.destroy 
    end  
    redirect_to root_path
  end  
  
  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :item_status_id, :shopping_cost_id, :prefecture_id, :shopping_date_id, :price, :image).merge(user_id: current_user.id)
  end  

  def set_item
    @item = Item.find(params[:id])
  end  

end
