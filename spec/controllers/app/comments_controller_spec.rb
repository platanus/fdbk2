require 'rails_helper'

RSpec.describe App::CommentsController, type: :controller do
  let(:provider) { create(:user) }
  let(:receiver) { create(:user) }
  let(:feedback_session) { create(:feedback_session, provider: provider, receiver: receiver) }
  let(:comment) { create(:comment, feedback_session: feedback_session) }

  describe "GET #new" do
    before do
      sign_in(provider)
      get :new, params: { feedback_session_id: feedback_session.id }
    end

    it { expect(response).to have_http_status(:success) }
  end

  describe "POST #create" do
    before do
      sign_in(provider)
    end

    context 'with valid body is sent' do
      before do
        post :create,
             params: { feedback_session_id: feedback_session.id,  body: 'This is a valid body' }
      end

      it { expect(response).to have_http_status(:created) }
      it { expect(feedback_session.comments.last.body).to eq('This is a valid body') }
    end

    context 'when invalid body is sent' do
      before do
        post :create, params: { feedback_session_id: feedback_session.id,  body: '' }
      end

      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end
end
