require 'rails_helper'

RSpec.describe StudentController, type: :controller do

  describe '#index' do
    context 'HTML' do
      let!(:students) { create(:student) }

      it 'render to the index' do
        get :index

        expect(response).to be_successful
        expect(response).to render_template :index
        expect(assigns(:students)).to match_array(students)
      end
    end
  end

  describe '#new' do
    context 'HTML' do
      it 'render to the new' do
        get :new

        expect(response).to render_template :new
        expect(assigns(:student)).to be_a_new Student
      end
    end
  end

  describe '#create' do
    let(:hash) do
      {
        name: 'test student',
        email: 'test@gmail.com'
      }
    end

    context 'HTML' do
      context 'valid' do
        it 'redirects to index' do

          post :create, params: { student: attributes_for(:student) }

          expect(response).to redirect_to student_index_path
          expect(assigns(:student)).to be_a Student
          expect(assigns(:student).persisted?).to eq true
          expect(assigns(:student)).to have_attributes(hash)
        end
      end
      context 'invalid' do
        it 'render to the new' do

          get :new, params: { student: attributes_for(:student, :invalid) }

          expect(response).to render_template :new
          expect(assigns(:student)).to be_a Student
          expect(assigns(:student).persisted?).to eq false
          expect(assigns(:student)).to have_attributes({})
        end
      end
    end
  end
end