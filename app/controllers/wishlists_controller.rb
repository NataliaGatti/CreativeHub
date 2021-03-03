class WishlistsController < ApplicationController
  def index
    @user = current_user
    @user_wishlist = @user.wishlist
  end

  def new
   @user = current_user
   @wishlist = Whishlist.new
  end

  def create
     @user = current_user
    @wishlist = Wishlist.new(wishlist_params)
    @wishlist.user = @user
    if @wishlist.save
      redirect_to user_wishlist_path(@user, @wishlist)
    else
      render 'new'
    end
  end
  

  def edit
  end

  def update
  end


end
