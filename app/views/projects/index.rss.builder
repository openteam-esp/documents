xml.instruct!

xml.rss 'version' => '2.0', 'xmlns:dc' => 'http://purl.org/dc/elements/1.1/' do
  xml.channel do
    xml.title ''
    xml.link root_url
    xml.description ''
  end

  collection.each do |document|
    xml.item do
      xml.title document.title
      xml.link project_url(document)
    end
  end
end

