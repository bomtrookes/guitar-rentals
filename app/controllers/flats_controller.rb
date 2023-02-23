class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {flat: flat}),
        marker_html: render_to_string(partial: "marker")
        # Pass the flat to the partial for additional info
        # marker_html: render_to_string(partial: "marker", locals: {flat: flat})
      }
    end
  end

  def new
    @flat = Flat.new
    @booking = @flat.bookings.build
  end


  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to @flat
    else
      render :new
    end
  end

  def show
    @booking = @flat.bookings.build
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to @flat
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :guests, :bedrooms, :beds, :bathrooms, :summary, :description, :cost_per_night)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
