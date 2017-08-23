require './app/models/link.rb'

RSpec.feature 'creating links' do

  scenario 'I would like to add the site\'s address and title' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.test.com/'
    fill_in 'title', with: 'Testcom'
    click_button 'Create link'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Testcom')
    end
  end
end
