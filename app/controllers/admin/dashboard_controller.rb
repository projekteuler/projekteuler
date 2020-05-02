class Admin::DashboardController < AdminController
  def index
    @current_problem_count = Problem.count
    @most_recent_pull = Problem.maximum(:pulled_at)
  end

  def pull_problems
    PullProblemsJob.perform_later
    redirect_to({:controller => 'admin/dashboard', :action => :index}, notice: t('.pull_problems_initiated'))
  end
end
