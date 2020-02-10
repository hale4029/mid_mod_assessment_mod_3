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
    end
    expect(page).to have_content('Name', count: 21)
    expect(page).to have_content('House', count: 21)
    expect(page).to have_content('Role')
    expect(page).to have_content('Patronus')
  end
end

# When I visit "/"
# And I Select “Gryffindor” from the select field
# (Note: Use the existing select field)
# And I click "Search For Members“
# Then I should be on page “/search”
# Then I should see a total of the number of members for that house. (21 for Gryffindor)
# And I should see a list of the 21 members of the Order of the Phoenix for house Gryffindor.
#
# And for each of the members I should see:
# - The name of the member
# - The members role (if it exists)
# - The house the member belongs to
# - The Patronus of the member (if it exists)
