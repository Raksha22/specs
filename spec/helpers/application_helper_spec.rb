require 'rails_helper'

describe '#admin?' do
  it 'return true' do
    expect(helper.admin?).to be true
  end
end

describe '#student_description' do
  it "returns the instance variable" do
    assign(:describe, "My Bio")
    expect(helper.student_description).to eq("My Bio")
  end
end