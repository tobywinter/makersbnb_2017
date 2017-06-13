feature 'list a space' do
  scenario 'host want to list a new space' do
    visit('/spaces/new')
    fill_in('name', with: 'One')
    fill_in('description', with: 'Lovely little studio to swing a cat')
    fill_in('rate', with: 90)
    fill_in('max_capacity', with: 3)
    click_button('List my Space')
    expect(current_path).to eq('/spaces')

    within 'ul#spaces' do
      expect(page).to have_content('One')
    end
  end
end
