=begin
def sign_in_and_play
  visit('/')
  fill_in :player_1_name, :with => 'Frank'
  fill_in :player_2_name, :with => 'Alf'
  click_button 'Submit'
end
=end

def sign_in_and_play
  visit '/'
  fill_in :player_1_name, :with => 'Frank'
  fill_in :player_2_name, :with => 'Alf'
  click_button 'Submit'
end
