require 'rails_helper'

RSpec.feature "Student", :type => :feature do
  describe '#create' do
    it "creates a new student" do

      visit "/student/new"

      click_button "Create Student"

      expect(page).to have_content('Student')
    end
  end
end