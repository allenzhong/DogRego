require 'rails_helper'

RSpec.describe "dogs/show", type: :view do
  before(:each) do
    @dog = assign(:dog, FactoryGirl.create(:dog))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@dog.name)
    expect(rendered).to match(@dog.breed)
    expect(rendered).to match(@dog.date_of_birth_on.strftime("%d/%m/%Y"))
  end
end
