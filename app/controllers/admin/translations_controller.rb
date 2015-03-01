class Admin::TranslationsController < AdminController
  before_action :set_translation, only: :show

  # GET /translations
  # GET /translations.json
  def index
    @translations = Translation.paginate(page: params[:page])
  end

  # GET /translations/1
  # GET /translations/1.json
  def show
  end

  def set_translation
    @translation = Translation.find(params[:id])
  end
end
