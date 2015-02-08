class TranslationsController < ApplicationController
  skip_before_action :authenticate_admin!, only: [:new, :create]
  before_action :set_translation, only: :show
  before_action :set_problem, only: [:new, :create]

  # GET /translations
  # GET /translations.json
  def index
    @translations = Translation.paginate(page: params[:page])
  end

  # GET /translations/1
  # GET /translations/1.json
  def show
  end

  # GET /translations/new
  def new
    @translation = @problem.translations.build
    if @problem.is_translated?
      @translation.title = @problem.translation.title
      @translation.content = @problem.translation.content
    end
  end

  # POST /translations
  # POST /translations.json
  def create
    @translation = @problem.translations.new(translation_params)

    respond_to do |format|
      if @translation.save
        format.html { redirect_to @problem, notice: t('translations.notice.successfully_created') }
        format.json { render :show, status: :created, location: @translation }
      else
        format.html { render :new }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_translation
      @translation = Translation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def translation_params
      params.require(:translation).permit(:title, :content)
    end

    def set_problem
      @problem = Problem.find(params[:problem_id])
    end
end
