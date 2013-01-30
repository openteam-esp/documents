class AddPaperclipToPaper < ActiveRecord::Migration
  def change
    add_attachment :papers, :attachment

    Paper.find_each do |paper|
      url = paper.file_url
      file = URI.decode url.match(/files\/\d+\/(.+)/)[1]
      filename = file.match(/(.+)\..+/i)[1]
      mimetype = MIME::Types.type_for(file).to_s.gsub(/\[|]/,'')

      paper.attachment_file_name = file
      paper.attachment_content_type = mimetype
      paper.attachment_file_size = 100
      paper.attachment_updated_at = Time.zone.now
      paper.attachment_url = url
      paper.save(:validate => false)
    end

    remove_column :papers, :file_url
  end
end
