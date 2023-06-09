class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_policy_scoped, :only => :index

  def index
    @pets = Pet.all

    # The `geocoded` scope filters only flats with coordinates
    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { pet: pet }),
        marker_html: render_to_string(partial: "marker", locals: { pet: pet })
      }
    end
    skip_authorization
  end

  def show
    # uses :set_pet
    @bookings = @pet.bookings

    @existing_reviews = @pet.reviews
    @booking = Booking.new
    authorize @pet
    @review = Review.new
    @other_pets = Pet.all.reject { |pet| pet.id == @pet.id }
    skip_authorization
  end

  def new
    @pet = Pet.new
    skip_authorization
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
    skip_authorization
  end

  def edit
    # uses :set_pet
  end

  def update
    # uses :set_pet
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  def destroy
    # uses :set_pet
    @pet.destroy
    redirect_to pets_path
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :availability, :breed, :description, :user_id, :photo, :address)
  end
end
