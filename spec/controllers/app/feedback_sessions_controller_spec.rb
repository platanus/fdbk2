require 'rails_helper'

RSpec.describe App::FeedbackSessionsController, type: :controller do
  let(:provider) { create(:user) }
  let(:receiver) { create(:user) }
  let(:feedback_session) { create(:feedback_session, provider: provider, receiver: receiver) }
  let(:comment) { create(:comment, feedback_session: feedback_session) }

  describe 'GET app/feedback_sessions#show' do
    before do
      sign_in(provider)
      get :show, params: { id: feedback_session.id }
    end

    it { expect(response).to have_http_status(:ok) }
  end
end
