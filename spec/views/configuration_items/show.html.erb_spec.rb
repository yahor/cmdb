require 'rails_helper'

RSpec.describe "configuration_items/show", type: :view do
  before(:each) do
    assign(:configuration_item, ConfigurationItem.create!(
      name: "Name",
      type: "Server",
      status: "Active",
      environment: "Production"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Server/)
    expect(rendered).to match(/Active/)
    expect(rendered).to match(/Production/)
  end
end
