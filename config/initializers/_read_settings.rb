Settings.read(Rails.root.join('config', 'settings.yml'))

Settings.defaults Settings.extract!(Rails.env)[Rails.env] || {}
Settings.extract!(:test, :development, :production)

Settings.define 'vfs.url',              :env_var => 'VFS_URL',    :required => true

Settings.resolve!
