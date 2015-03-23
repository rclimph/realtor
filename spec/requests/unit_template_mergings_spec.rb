require 'spec_helper'

describe "UnitTemplateMergings" do
  describe "GET /unit_template_mergings" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get unit_template_mergings_path
      response.status.should be(200)
    end
  end
end
