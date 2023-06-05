class PetsController < ApplicationController

  def index
     @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @pet = Pet.new(params[:pet])
    @pet.save
    redirect_to pet_path(@pet)
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :availability, :breeed, :description)
  end
end
