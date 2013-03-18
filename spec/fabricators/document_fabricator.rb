Fabricator(:document) do
  kind            'decision'
  title           'title'
  number          '123123'
  approved_on     '2011-12-19'
  attachment      { open 'spec/fixtures/empty.pdf' }
  context!
end
