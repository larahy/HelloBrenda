require 'spec_helper'

describe 'filtering by tags' do 

  before do 
    tag = create(:tag, :tag 'yolo')
    tagged = create(:article, :title 'tagged article')
    create(:article, title: 'another')
    expect()
  end
  