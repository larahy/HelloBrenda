require 'spec_helper'

describe 'loading comments' do
  before do
    article = create(:article)
    create(:comment, article: article)
  end

  it 'should load comments with AJAX when I click show comments', js: true do
    visit '/articles'
    click_link 'Show comments'
    expect(page).to have_content 'MyText'
  end
end