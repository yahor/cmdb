require 'rails_helper'

RSpec.describe "configuration_items/index", type: :view do
  before(:each) do
    assign(:configuration_items, [
      Server.create!(
        name: "Name",
        status: "Active",
        environment: "Production"
      ),
      Application.create!(
        name: "Name2",
        status: "Active",
        environment: "Production"
      ),
      Database.create!(
        name: "Name3",
        status: "Active",
        environment: "Production"
      )
    ])
  end

  it "renders a list of configuration_items" do
    render
    cell_selector = '#configuration_items > table > tbody > tr > td'

    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 3
    assert_select cell_selector, text: Regexp.new("Server".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("Application".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("Database".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("Active".to_s), count: 3
    assert_select cell_selector, text: Regexp.new("Production".to_s), count: 3
  end
end
