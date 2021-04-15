class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :edit, :destroy]
  before_action :set_item_user, only: [:update, :edit, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
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

  def destroy
   if @item.destroy
     redirect_to root_path
    else
     render :show
   end
  end

  def edit
    if current_user == @item.user
    redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :prefecture_id, :price, :postage_id, :shipping_date_id, :status_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_item_user
    redirect_to root_path if current_user.id != @item.user_id || @item.order == nil
  end

end
