require 'rails_helper'

RSpec.describe "dogs/show", type: :view do
  before(:each) do
    @dog = assign(:dog, Dog.create!(
      :name => "Name",
      :breed => "Breed"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Breed/)
  end
end
