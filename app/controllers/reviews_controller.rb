class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @flat = Flat.find(params[:flat_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.flat = Flat.find(params[:flat_id])
    if @review.save
      redirect_to flat_path(@review.flat)
    else
      render :new
    end
  end

  def edit
    @flat = Flat.find(params[:flat_id])
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.user = current_user
    if @review.update(review_params)
      redirect_to flat_path(@review.flat)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to flat_path(@review.flat)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
