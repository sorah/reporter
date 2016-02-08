require 'rails_helper'

RSpec.describe "IncidentTypes", :type => :request do
  describe "GET /incident_types" do
    it "works! (now write some real specs)" do
      get incident_types_path
      expect(response).to have_http_status(200)
    end
  end
end
