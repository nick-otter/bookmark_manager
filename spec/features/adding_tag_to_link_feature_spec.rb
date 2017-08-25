require './app/models/link.rb'

RSpec.feature 'adding tags to links' do

  scenario 'I would like to add tags when I add a link' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.test.com/'
    fill_in 'title', with: 'Testcom'
    fill_in 'tags', with: 'Testtag'
    click_button 'Create link'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Testcom')
      expect(page).to have_content('Testtag')
    end
  end
end
