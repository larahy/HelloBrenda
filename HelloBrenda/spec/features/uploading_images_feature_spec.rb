require 'spec_helper'

describe 'uploading photos' do 
  it 'allows photos to be attached on post form' do 
    visit '/articles/new'
    fill_in 'Title', with: 'Hyperkewl'
    attach_file 'Image', Rails.root.join('spec/images/Crazy_Fun.jpg')
    click_button 'Save article'
    expect(page).to have_css 'img.instagram-upload'
  end
end 