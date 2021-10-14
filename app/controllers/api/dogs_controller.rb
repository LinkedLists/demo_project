class Api::DogsController < ApplicationController
  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      # render show
    else
      # render json: @dog.errors.full_messages, status: 400
    end
  end

  def index
    @dogs = Dog.includes(:toys).all
    # render index
  end

  def show
    @dog = Dog.find_by(id: params[:id])
    # render show if @dog
  end


  # dog updates name?
  def update
    @dog = Dog.find_by(id: params[:id])

    if @dog.update(dog_params)
      # render show
    else
      # render json: @dog.eoors.full_messages, status: 400
    end
  end

  

  private
  def dog_params
    params.require(:dog).permit(:name)
  end
end
