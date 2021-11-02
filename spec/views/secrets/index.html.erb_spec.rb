require 'rails_helper'

describe 'secrets/index.html.erb' do

  it 'checks for admin access' do
    render
    expect(rendered).to match('Secret admin')
  end
end