require 'spec_helper.rb'

feature 'Enter names' do
  scenario 'submitting names' do
    visit('/')
    fill_in :player_1_name, with: 'Frank'
    fill_in :player_2_name, with: 'Alf'
    click_button 'Submit'
    expect(page).to have_content 'Frank vs. Alf'
  end
end
