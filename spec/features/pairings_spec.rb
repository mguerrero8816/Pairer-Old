require 'rails_helper'

RSpec.feature "Pairings", type: :feature do
  context 'after viewing a class' do
    Steps 'pairing students' do
      When 'I visit the website, add students, and view the class' do
        visit '/'
        fill_in 'firstName', with: 'Mike'
        fill_in 'lastName', with: 'Guerrero'
        select '1', :from => 'classNumber'
        click_button 'Add Student'
        fill_in 'firstName', with: 'Someone'
        fill_in 'lastName', with: 'Here'
        select '1', :from => 'classNumber'
        click_button 'Add Student'
      end
      And 'I can click the Pair button' do
        click_link 'Pair'
      end
      Then 'I can see the students paired' do
        expect(page).to have_content 'Mike Guerrero and Someone Here'
        expect(page).to have_content 'Someone Here and Mike Guerrero'
      end
      When 'I add more students' do
        fill_in 'firstName', with: 'Something'
        fill_in 'lastName', with: 'Else'
        select '1', :from => 'classNumber'
        click_button 'Add Student'
        fill_in 'firstName', with: 'Kevin'
        fill_in 'lastName', with: 'Bacon'
        select '1', :from => 'classNumber'
        click_button 'Add Student'
        fill_in 'firstName', with: 'Mr.'
        fill_in 'lastName', with: 'Anderson'
        select '1', :from => 'classNumber'
        click_button 'Add Student'
        fill_in 'firstName', with: 'Hideo'
        fill_in 'lastName', with: 'Kojima'
        select '1', :from => 'classNumber'
        click_button 'Add Student'
        select 'Class 1', :from => 'seeClass'
        click_button 'See Class'
      end
      Then "I can still see the first pairs" do
        expect(page).to have_content 'Mike Guerrero and Someone Here' || 'Someone Here and Mike Guerrero'
      end
      And 'I can make more pairs' do
        click_link 'Pair'
      end
    end
  end
end
