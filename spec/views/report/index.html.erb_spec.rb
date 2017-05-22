require 'rails_helper'

RSpec.describe "report/index", type: :view do
  before(:each) do
    @dog1 = FactoryGirl.create(:dog)
    @dog2 = FactoryGirl.create(:dog)
    assign(:users, [
      @dog1.user,
      @dog2.user
    ])
  end

  it "renders a list of users" do
    render
    expect(rendered).to have_content(@dog1.name)
    expect(rendered).to have_content(@dog2.name)
    expect(rendered).to have_content("Ownership registration: Have not been registered")
  end
end
