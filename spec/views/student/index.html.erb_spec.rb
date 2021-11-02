require 'rails_helper'

describe 'student/index.html.erb' do

  it 'displays the students' do
    assign(:students, [
      stub_model(Student, name: 'slicer', email: 'test@gmail.com'),
      stub_model(Student, name: 'slicers', email: 'test1@gmail.com'),
    ])

    render

    expect(rendered).to match('slicer')
    expect(rendered).to match('test@gmail.com')
    expect(rendered).to match('slicers')
    expect(rendered).to match('test1@gmail.com')
  end
end