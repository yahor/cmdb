require 'rails_helper'

RSpec.describe "configuration_items/show", type: :view do
  let(:ci) {
    create(:server_configuration_item,
      status: "Active",
      environment: "Production"
    )
  }
  before(:each) do
    assign(:configuration_item, ci)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to include(ci.class.name)
    expect(rendered).to match(/Server/)
    expect(rendered).to match(/Active/)
    expect(rendered).to match(/Production/)
  end
end
