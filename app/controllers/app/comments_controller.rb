class App::CommentsController < App::BaseController
  before_action :feedback_session, only: [:new, :create]

  def new; end

  def create
    comment = feedback_session.comments.create(body: params[:body])
    if comment.persisted?
      respond_with feedback_session, location: nil, status: :created
    else
      respond_with comment.errors, location: nil, status: :unprocessable_entity
    end
  end

  private

  def feedback_session
    @feedback_session ||= FeedbackSession.find(params[:feedback_session_id])
  end
end
