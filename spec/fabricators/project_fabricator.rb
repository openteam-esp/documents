Fabricator(:project) do
  kind          'decision'
  title         'title'
  published_on  '2011-12-19'
  file_url      '/public/1.doc'
  context!
end
