class GuitarsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_guitar, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :new, :edit, :owned]

  def destroy
    @guitar = Guitar.find(params[:id])
    if @guitar.destroy!
      puts "trying to destory!"
      redirect_to guitars_path
    else
      redirect_to guitars_path
    end
  end

  def index
    if params[:query].present?
      @guitars = Puzzle.search_all_guitars(params[:query])
    else
      @puzzles = Puzzle.all
      @guitars = Guitar.all
      @markers = @guitars.geocoded.map do |guitar|
        {
          lat: guitar.latitude,
          lng: guitar.longitude,
          info_window_html: render_to_string(partial: "info_window", locals: {guitar: guitar}),
          marker_html: render_to_string(partial: "marker")
        }
      end
    end
  end

  def new
    @guitar = Guitar.new
    @booking = @guitar.bookings.build
  end


  def create
    @guitar = Guitar.new(guitar_params)
    @guitar.user = current_user
    if @guitar.save
      redirect_to @guitar
    else
      render :new
    end
  end

  def show
    @user = @guitar.user
    @booking = @guitar.bookings.build
    @markers =
      [
        lat: @guitar.latitude,
        lng: @guitar.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {guitar: @guitar}),
        marker_html: render_to_string(partial: "marker")
      ]
  end

  def edit
  end

  def update
    @guitar.user = current_user
    if @guitar.update(guitar_params)
      redirect_to @guitar
    else
      render :edit
    end
  end

  def owned
    @guitars = current_user.guitars
  end

  private

  def guitar_params
    params.require(:guitar).permit(:name, :address, :caption, :description, :cost_per_day, :guitar_type, :user_id, photos: [])
  end

  def set_guitar
    @guitar = Guitar.find(params[:id])
  end

  def set_user
    @user = current_user
  end
end
