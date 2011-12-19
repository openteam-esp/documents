require 'spec_helper'

describe Paper do
  it { should validate_presence_of :kind }
  it { should validate_presence_of :authority }
  it { should validate_presence_of :title }
  it { should validate_presence_of :published_on }

  it { should allow_value('decision').for(:kind) }
  it { should allow_value('direction').for(:kind) }
  it { should allow_value('order').for(:kind) }

  it { should_not allow_value('blablabla').for(:kind) }
end
