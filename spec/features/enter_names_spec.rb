require 'spec_helper.rb'


feature 'Enter names', :type => :feature do
  scenario 'submitting names' do
    sign_in_and_play
    expect(page).to have_content 'Frank vs. Alf'
  end
end

feature 'Enemy hit points' do
  scenario 'at start, see enemy hit points' do
    sign_in_and_play
    expect(page).to have_content 'Alf: 60/60 HP'
  end
  scenario 'player 1 attacks player 2' do
    sign_in_and_play
    click_button('Attack Player 2')
    expect(page).to_not have_content 'Alf: 60/60 HP'
  end
end
