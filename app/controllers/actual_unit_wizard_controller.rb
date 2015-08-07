class ActualUnitWizardController < ApplicationController
  include Wicked::Wizard
  
  steps :select_unit_template, :enter_unit_data, :assign_subunits
end
