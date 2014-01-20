require 'spec_helper'

describe 'creating and editing articles' do 

  context 'creating' do 

    it 'should display the title and truncated article' do 
      visit '/articles/new'
      fill_in 'Title', with: '5 best donkeys'
      fill_in 'Content', with: 'donkeys can be very cool'
      click_button 'Create Article'
      expect(current_path).to eq '/articles'
      expect(page).to have_content 'donkeys can be very cool'
    end

  end

  context 'editing' do

    it 'should be possible to edit the title' do 
      Article.create(title: 'Article 1', content: 'I am the first')
      visit '/articles'
      click_link 'Edit information'
      fill_in 'Content', with: 'yeeeha'
      click_button 'submit_button'
      expect(page).to have_content 'yeeeha'
    end 

  end

end

