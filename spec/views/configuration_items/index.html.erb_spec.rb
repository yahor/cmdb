require 'rails_helper'

RSpec.describe "configuration_items/index", type: :view do
  before(:each) do
    assign(:configuration_items, [
      ConfigurationItem.create!(
        name: "Name",
        type: "Server",
        status: "Active",
        environment: "Production"
      ),
      ConfigurationItem.create!(
        name: "Name",
        type: "Server",
        status: "Active",
        environment: "Production"
      )
    ])
  end

  it "renders a list of configuration_items" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Type".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Status".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Environment".to_s), count: 2
  end
end
