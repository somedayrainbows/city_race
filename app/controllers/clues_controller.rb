class CluesController < ApplicationController
  before_action :authorize

  def index
    # require 'pry'; binding.pry
    @hunt = Hunt.find(params[:hunt_id])
  end
end
