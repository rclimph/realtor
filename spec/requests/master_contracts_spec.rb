require 'spec_helper'

describe "MasterContracts" do
  describe "GET /master_contracts" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get master_contracts_path
      response.status.should be(200)
    end
  end
end
