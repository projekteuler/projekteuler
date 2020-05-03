class TranslationsController < ApplicationController
  before_action :set_problem, only: [:new, :create]
  before_action :set_accept, only: [:create]

  # GET /translations/new
  def new
    @translation = @problem.translations.build
    if @problem.is_translated?
      @translation.title = @problem.translation.title
      @translation.content = @problem.translation.content
    else
      @translation.title = @problem.original_title
      @translation.content = @problem.original_content
    end
  end

  # POST /translations
  def create
    @translation = @problem.translations.new(translation_params)
    if user_signed_in?
      @translation.author = current_user
    end
    if @translation.save
      if @accept
        @problem.set_translation(@translation)
        redirect_to @problem, notice: t('translations.notice.successfully_created_and_accepted')
      else
        redirect_to @problem, notice: t('translations.notice.successfully_created')
      end
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

    def set_accept
      if user_signed_in? and current_user.admin?
        @accept = params.fetch(:accept, false)
      else
        @accept = false
      end
    end
end
