class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :destroy, :update]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

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

  # def destroy
  #  if @item.destroy
    #  redirect_to root_path
    # else
    #  render :show
  #  end
  # end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def show
    
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params) 
      redirect_to root_path
    else 
      render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :prefecture_id, :price, :postage_id, :shipping_date_id, :status_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
