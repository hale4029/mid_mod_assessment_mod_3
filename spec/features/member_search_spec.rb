require 'rails_helper'

describe 'manager serach page' do
  it 'clicks search for Members' do
    visit root_path
    select "Gryffindor", :from => "house"
    click_on 'Search For Members'

    expect(current_path).to eq('/search')
    expect(page).to have_content('21 Members')
    within '#members' do
      expect(page).to have_css('#member', count: 21)
      expect(page).to have_content('Name', count: 21)
      expect(page).to have_content('House', count: 21)
      expect(page).to have_content('Role')
      expect(page).to have_content('Patronus')
    end
  end
end
