class TranslationsController < ApplicationController
  before_action :set_problem, only: [:new, :create]

  # GET /translations/new
  def new
    @translation = @problem.translations.build
    if @problem.is_translated?
      @translation.title = @problem.translation.title
      @translation.content = @problem.translation.content
    end
  end

  # POST /translations
  def create
    @translation = @problem.translations.new(translation_params)
    if user_signed_in?
      @translation.author = current_user
    end
    if @translation.save
      redirect_to @problem, notice: t('translations.notice.successfully_created')
    else
      render :new
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def translation_params
      params.require(:translation).permit(:title, :content)
    end

    def set_problem
      @problem = Problem.find(params[:problem_id])
    end
end
