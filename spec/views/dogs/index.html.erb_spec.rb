require 'rails_helper'

RSpec.describe "dogs/index", type: :view do
  before(:each) do
    @dog1 = FactoryGirl.create(:dog)
    @dog2 = FactoryGirl.create(:dog)
    assign(:dogs, [
      @dog1,
      @dog2
    ])
  end

  it "renders a list of dogs" do
    render
    assert_select "tr>td", :text => @dog1.name, :count => 1 
    assert_select "tr>td", :text => @dog1.breed, :count => 1 
    assert_select "tr>td", :text => @dog2.name, :count => 1 
    assert_select "tr>td", :text => @dog2.breed, :count => 1 
  end
end
