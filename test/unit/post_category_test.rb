require_relative '../test_helper'

class PostCategoryTest < Test::Unit::TestCase

  def setup
    PostCategory.destroy_all
  end
  
  subject { PostCategory.new }
  
  should validate_presence_of(:name)
  
  should "automatically set path" do
    @category = Factory.create(:post_category, :name => "This should parameterize")
    assert_equal "this-should-parameterize", @category.permalink
  end
  
  should "not duplicate path" do
    @category1 = Factory.create(:post_category)
    @category2 = Factory.create(:post_category)
    assert @category1.permalink != @category2.permalink
  end
   
end
