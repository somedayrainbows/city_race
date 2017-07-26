class Api::V1::CluesController < Api::V1::BaseController
  def index
    respond_with Clue.all
  end

  def create
    respond_with :api, :v1, Clue.create(clue_params)
  end

  def destroy
    respond_with Clue.destroy(params[:id])
  end

  def update
    clue = Clue.find(params["id"])
    clue.update_attributes(clue_params)
    respond_with clue, json: clue
  end

  private

  def clue_params
    params.require(:clue).permit(:title, :description, :task_type, :order)
  end

end
