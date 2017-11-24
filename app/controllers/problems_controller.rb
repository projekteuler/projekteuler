class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show]

  def index
    @problems = Problem.paginate(page: params[:page]).includes(:translation)
    @translated_percentage = 100 * Problem.translated_count / Problem.count
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
