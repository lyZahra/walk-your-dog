class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @pet = @review.pet
    authorize @review
  end

  def new
    @review = Review.new
    @pet = Pet.find(params[:pet_id])
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @pet = Pet.find(params[:pet_id])
    @review.pet = @pet
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
