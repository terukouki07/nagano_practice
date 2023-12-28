class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end
  
  def index
  end

  def show
  end

  def edit
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :genre_id, :introduction, :is_active, :price)
  end
end
