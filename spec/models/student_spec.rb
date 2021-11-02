require 'rails_helper'

RSpec.describe Student, type: :model do
  
  #model validation
  describe 'validation' do
    subject { build(:student) }

    context '#name' do
      it { is_expected.to validate_presence_of :name }
    end

    context '#email' do
      it { is_expected.to validate_presence_of :email }
    end

    context 'valid email' do
      let(:email) { 'test@gmail.com' }

      it 'when format is valid'do
        expect(subject.email).to eq(email)
      end
    end

    context 'invalid email' do
      let(:email) { 'test@.com' }

      it 'when format is invalid' do
        expect(subject.email).to_not eq(email)
      end
    end
  end

  describe 'Association' do
    context 'when has_many subjects' do
      it { should have_many :subjects }
    end
  end

  #Mocking with double
  describe '#study' do
    let(:student) { double }

    it 'return a string' do
      allow(student).to receive(:study) { 'i m student' }
    end
  end

  #Webmock and studding
  describe '.students' do
    let(:students_response) { Student.students }
    
    it "returns valid data", :vcr do

    mock_response = {
      :status => 200,
      :data => [{
        :id=>1,
          :employee_name=>"Tiger Nixon",
          :employee_salary=>320800,
          :employee_age=>61, :profile_image=>""
      }]
    }
    stub_request(:get, "http://dummy.restapiexample.com/api/v1/employees").
    to_return(status: 200, body: mock_response.to_json)

      expect(students_response).to be_kind_of(Hash)
      expect(students_response).to have_key(:status)
      expect(students_response[:status]).to eq(200)
      expect(students_response).to have_key(:data)
      expect(students_response[:data].first).to eq(
        {
          :id=>1,
          :employee_name=>"Tiger Nixon",
          :employee_salary=>320800,
          :employee_age=>61, :profile_image=>""
        }
      )
    end
  end
end
