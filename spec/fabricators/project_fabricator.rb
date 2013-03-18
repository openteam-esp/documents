Fabricator(:project) do
  kind            'decision'
  title           'title'
  published_on    '2011-12-19'
  attachment      { open 'spec/fixtures/empty.pdf' }
  context!
end
