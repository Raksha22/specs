require 'rails_helper'

RSpec.describe StudentController, type: :request do

  describe '#index' do
    let!(:student) { create(:student, name: 'test') }

    context 'HTML' do
      it 'render to the index' do
        get student_index_path

        expect(response).to be_successful
        expect(response).to render_template :index
        expect(response.body).to include('test')
        expect(assigns(:students)).to match_array(student)
      end
    end
  end

  describe '#new' do
    context 'HTML' do
      it 'render to the new' do
        get new_student_path

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

          post student_index_path, params: { student: attributes_for(:student) }

          expect(response).to redirect_to student_index_path
          expect(assigns(:student)).to be_a Student
          expect(assigns(:student).persisted?).to eq true
          expect(assigns(:student)).to have_attributes(hash)
        end
      end
      context 'invalid' do
        it 'render to the new' do

          get new_student_path, params: { student: attributes_for(:student, :invalid) }

          expect(response).to render_template :new
          expect(assigns(:student)).to be_a Student
          expect(assigns(:student).persisted?).to eq false
          expect(assigns(:student)).to have_attributes({})
        end
      end
    end
  end

  describe '#update' do
    let!(:student) { create(:student) }

    context 'with valid params' do
      context 'HTML' do
        it 'redirects to index' do
        
          put student_path(id: student.id), params: { id: student.id, student: attributes_for(:student) }

          expect(response).to redirect_to student_index_path(student.id)
          expect(assigns(:student)).to eq student
        end
      end
    end

    context 'with invalid params' do
      context 'HTML' do
        it 'redirects to index' do

          get edit_student_path(id: student.id), params: { student: attributes_for(:student, :invalid) }

          expect(response).to render_template :edit
        end
      end
    end
  end

  describe '#destroy' do
    let!(:student) { create(:student) }

    context 'HTML' do
      it 'redirects to index' do

        delete student_path(id: student.id), params: { id: student.id }

        expect(response).to redirect_to student_index_path
      end
    end
  end
end