class FavouritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_guitar, only: [:create, :destroy]

  def index
    @user = current_user
    if params[:query].present?
      @favourites = Guitar.search_user_favourites(params[:query])
    else
      @favourites = current_user.favourites.map(&:guitar)
    end
  end

  def create
    @guitar.favourites.create!(user: current_user)
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  def destroy
    @favourite = current_user.favourites.find(params[:id])
    @favourite.destroy
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  private

  def set_guitar
    @guitar = Guitar.find(params[:guitar_id])
  end
end
