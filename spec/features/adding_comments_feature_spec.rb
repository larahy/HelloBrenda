require 'spec_helper'

describe 'adding comments to a post' do 

	before do 
		create(:article)
	end 

	it 'adds comment from a form' do
		visit '/articles'
		click_link 'Add comment'
		fill_in 'Text', with: 'wow'
		click_button "Create comment"
		expect(page).to have_content 'wow'
	end

end
