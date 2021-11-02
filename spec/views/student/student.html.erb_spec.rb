require 'rails_helper'

describe 'rendering the student template' do
  it 'displays the student' do
    assign(:student, stub_model(Student, name: 'slicer'))

    render template: 'student/student.html.erb'

    expect(rendered).to match('slicer')
  end
end