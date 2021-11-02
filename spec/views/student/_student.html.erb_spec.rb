require 'rails_helper'

describe 'rendering locals in a partial' do
  let(:student) { stub_model(Student, name: 'slicer') } 

  it 'displays the student' do
    render partial: 'student/student.html.erb', locals: {student: student}

    expect(rendered).to match('slicer')
  end
end
