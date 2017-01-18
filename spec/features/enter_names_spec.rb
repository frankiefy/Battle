require 'spec_helper.rb'

feature 'Enter names' do
  scenario 'submitting names' do
    visit('/')
    fill_in :player_1_name, with: 'Frank'
    fill_in :player_2_name, with: 'Alf'
    click_button 'Submit'
    expect(page).to have_content 'FRANK vs. ALF'
  end
end

feature 'Enemy hit points' do
  scenario 'at start, see enemy hit points' do
    visit('/')
    fill_in :player_1_name, with: 'Frank'
    fill_in :player_2_name, with: 'Alf'
    click_button 'Submit'
    expect(page).to have_content 'Alf: 60/60 HP'
  end
end
