class App::FeedbackSessionsController < App::BaseController
  def index
    @provider_sessions = current_user.providers.includes(:provider, :receiver)
  end

  def show
    @feedback_session = FeedbackSession.find(params[:id])
    @comments = @feedback_session.comments
  end
end
