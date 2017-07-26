class HuntsController < ApplicationController
  before_action :authorize

  def show
    @hunt = Hunt.find(params[:id])
  end

  def index
    @hunts = current_user.hunts.all
  end

  def new
    @hunt = current_user.hunts.new

  end

  def create
    @hunt = current_user.hunts.new(hunt_params)
    if @hunt.save
      redirect_to hunts_path, notice: "Your hunt was created successfully."
    else
      render :new, notice: "Something went wrong. Please try again."
    end
  end

  def edit
    # require 'pry'; binding.pry
    @hunt = current_user.hunts.find_by(params[:id])
  end

  def destroy
    @hunt = current_user.hunts.find_by(params[:id])
  end

  private

  def hunt_params
    params.require(:hunt).permit(:name, :description)
  end

end
