feature 'view space' do

  before(:each) do
    sign_up
    sign_in
  end

  scenario 'host want to view a space' do
    visit('/spaces/new')
    create_space(name: 'One')

    within 'ul#spaces' do
      expect(page).to have_content('One')
    end
    visit('/spaces/new')
    create_space(name: 'Two')

    within 'ul#spaces' do
      expect(page).to have_content('One')
      expect(page).to have_content('Two')
    end

    first(:link, 'See Space').click
    expect(current_path).not_to eq("/spaces/#{Space.all[-1].id}")
    expect(page).to have_content('One')
  end

  scenario 'guest wants to view spaces available within specified dates' do
    visit('/spaces/new')
    create_space(name: 'OneSearch')
    visit('/spaces/new')
    create_space(name: 'TwoSearch', available_from_date: '01/08/2017', available_to_date: '30/08/2017')
    fill_in('search_available_from', with: '01/07/2017')
    fill_in('search_available_to', with: '31/07/2017')
    click_button('Find Spaces')

    within 'ul#spaces' do
      expect(page).to have_content('OneSearch')
      expect(page).not_to have_content('TwoSearch')
    end
  end
end
