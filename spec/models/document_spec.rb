require 'spec_helper'

describe Document do
  it { should validate_presence_of :number }
  it { should validate_presence_of :approved_on }
end
