require 'rails_helper'

RSpec.describe Subject, type: :model do

  describe 'Assosiation' do
    it { should belong_to(:student) }
  end
end
