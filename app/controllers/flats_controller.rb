class FlatsController < ApplicationController
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

  def show
    @flat = Flat.find(params[:id])
  end

end
