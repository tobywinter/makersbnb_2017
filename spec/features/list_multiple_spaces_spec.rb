feature 'list multiple spaces' do
  scenario 'host want to list new spaces' do
    sign_up
    sign_in

    visit('/spaces/new')
    create_space
    expect(current_path).to eq('/spaces')

    visit('/spaces/new')
    create_space(name: 'Two')
    expect(current_path).to eq('/spaces')

    within 'ul#spaces' do
      expect(page).to have_content('One')
      expect(page).to have_content('Two')
    end
  end

end
