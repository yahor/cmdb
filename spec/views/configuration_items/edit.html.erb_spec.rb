require 'rails_helper'

RSpec.describe "configuration_items/edit", type: :view do
  let(:configuration_item) {
    ConfigurationItem.create!(
      name: "MyString",
      type: "Server",
      status: "Active",
      environment: "Production"
    )
  }

  before(:each) do
    assign(:configuration_item, configuration_item)
  end

  it "renders the edit configuration_item form" do
    render

    assert_select "form[action=?][method=?]", configuration_item_path(configuration_item), "post" do
      assert_select "input[name=?]", "configuration_item[name]"

      assert_select "input[name=?]", "configuration_item[type]"

      assert_select "input[name=?]", "configuration_item[status]"

      assert_select "input[name=?]", "configuration_item[environment]"
    end
  end
end
