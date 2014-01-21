require 'spec_helper'

describe Article do
  it 'can be given comma separated tags' do 
    article = create(:article, tag_input: 'yeeha, bethlehem')
    expect(article.tags.count).to eq(2)
  end

  it 'should reuse existing tags' do 
    article = create(:article, tag_input: 'yeeha, yolo')
    second_article = create(:article, tag_input: 'new, yolo')
    expect(Tag.count).to eq(3)
  end

end
