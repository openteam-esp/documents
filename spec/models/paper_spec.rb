require 'spec_helper'

describe Paper do
  it { should validate_presence_of :kind }
  it { should validate_presence_of :authority }
  it { should validate_presence_of :title }
  it { should validate_presence_of :published_on }
end
