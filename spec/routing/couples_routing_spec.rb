require "rails_helper"

RSpec.describe CouplesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/couples").to route_to("couples#index")
    end

    it "routes to #show" do
      expect(:get => "/couples/1").to route_to("couples#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/couples").to route_to("couples#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/couples/1").to route_to("couples#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/couples/1").to route_to("couples#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/couples/1").to route_to("couples#destroy", :id => "1")
    end
  end
end
