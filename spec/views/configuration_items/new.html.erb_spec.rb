require 'rails_helper'

RSpec.describe "configuration_items/new", type: :view do
  before(:each) do
    assign(:configuration_item, ConfigurationItem.new(
      name: "MyString",
      type: "",
      status: "Active",
      environment: "Production"
    ))
  end

  it "renders new configuration_item form" do
    render

    assert_select "form[action=?][method=?]", configuration_items_path, "post" do
      assert_select "input[name=?]", "configuration_item[name]"

      assert_select "input[name=?]", "configuration_item[type]"

      assert_select "input[name=?]", "configuration_item[status]"

      assert_select "input[name=?]", "configuration_item[environment]"
    end
  end
end
