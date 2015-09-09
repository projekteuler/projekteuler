class Admin::DashboardController < AdminController
  def index
    @current_problem_count = Problem.count
  end

  def update_problem_count
    begin
      new_problem_count = params[:problem_count].to_i
      raise t('no_problem_count') unless new_problem_count
      Problem.update_count(new_problem_count)
      redirect_to({:controller => 'admin/dashboard', :action => :index}, notice: t('.success_message'))
    rescue => e
      redirect_to({:controller => 'admin/dashboard', :action => :index}, alert: t('.failure_message', error: e.message))
    end
  end
end
