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

  # Never trust parameters from the scary internet, only allow the white list through.
  def problem_params
    params.require(:problem)
  end
end