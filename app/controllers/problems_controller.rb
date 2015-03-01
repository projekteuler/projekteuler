class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show]

  def index
    @problems = Problem.paginate(page: params[:page]).includes(:translation)
  end

  def show
    unless @problem.is_translated?
      render action: "untranslated"
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_problem
    @problem = Problem.find(params[:id])
  end
end
