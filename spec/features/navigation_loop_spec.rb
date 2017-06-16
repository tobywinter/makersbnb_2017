feature 'navigation loop space' do
  scenario 'host wants to navigate from the current space back to spaces' do
    sign_up
    sign_in
    visit('/spaces/new')
    create_space(name: 'OneLoop')

    within 'ul#spaces' do
      expect(page).to have_content('OneLoop')
    end

    visit('/spaces/new')
    create_space(name: 'TwoLoop')

    within 'ul#spaces' do
      expect(page).to have_content('OneLoop')
      expect(page).to have_content('TwoLoop')
    end

    first(:link, 'See Space').click

    expect(current_path).to eq("/spaces/#{Space.all[-2].id}")
    expect(page).to have_content('OneLoop')

    click_button('Back to Spaces')
    expect(current_path).to eq('/spaces')
    expect(page).to have_content('OneLoop')

  end
end
