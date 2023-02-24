class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @guitar = Guitar.find(params[:guitar_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.guitar = Guitar.find(params[:guitar_id])
    if @review.save
      redirect_to guitar_path(@review.guitar)
    else
      render :new
    end
  end

  def edit
    @guitar = Guitar.find(params[:guitar_id])
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.user = current_user
    if @review.update(review_params)
      redirect_to guitar_path(@review.guitar)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to guitar_path(@review.guitar)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
