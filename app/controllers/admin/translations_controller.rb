class Admin::TranslationsController < AdminController
  before_action :set_translation, only: [:show, :accept, :decline]

  # GET /translations
  def index
    @translations = Translation.pending.order(created_at: :desc).paginate(page: params[:page])
  end

  # GET /translations/1
  def show
  end

  def accept
    raise t('.must_be_pending') unless @translation.pending?
    @translation.problem.set_translation(@translation)
    redirect_to @translation.problem, notice: t('.success_message')
  end

  def decline
    raise t('.must_be_pending') unless @translation.pending?
    @translation.declined!
    redirect_to admin_translations_path, notice: t('.success_message')
  end

  def set_translation
    @translation = Translation.find(params[:translation_id])
  end
end
