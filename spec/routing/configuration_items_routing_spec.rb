require "rails_helper"

RSpec.describe ConfigurationItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/configuration_items").to route_to("configuration_items#index")
    end

    it "routes to #new" do
      expect(get: "/configuration_items/new").to route_to("configuration_items#new")
    end

    it "routes to #show" do
      expect(get: "/configuration_items/1").to route_to("configuration_items#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/configuration_items/1/edit").to route_to("configuration_items#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/configuration_items").to route_to("configuration_items#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/configuration_items/1").to route_to("configuration_items#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/configuration_items/1").to route_to("configuration_items#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/configuration_items/1").to route_to("configuration_items#destroy", id: "1")
    end
  end
end
