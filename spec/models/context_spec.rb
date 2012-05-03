require 'spec_helper'

describe Context do
  it { should have_many :papers }

  let(:joins_papers_uniq_sql) { 'SELECT DISTINCT "contexts".* FROM "contexts" INNER JOIN "papers" ON "papers"."context_id" = "contexts"."id" ORDER BY weight' }

  specify { Context.with_papers.to_sql.should == joins_papers_uniq_sql }
end
