feature 'view space' do
  scenario 'host want to view a space' do
    sign_up
    sign_in

    visit('/spaces/new')
    create_space

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
    expect(current_path).not_to eq('/spaces/Space.all[-1].id')
    expect(page).to have_content('One')
  end
end
