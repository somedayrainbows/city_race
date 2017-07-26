class HuntsController < ApplicationController
  before_action :authorize

  def show
    @hunt = Hunt.find(params[:id])
  end

  def index
    @hunts = current_user.hunts.all
  end

  def new

  end

  def create

  end

  def edit
    @hunt = current_user.hunts.find_by(params[:id])
  end

  def destroy
    @hunt = current_user.hunts.find_by(params[:id])
  end

end
