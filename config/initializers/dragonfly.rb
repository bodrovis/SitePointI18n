require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "997d6019f7319f91febf1540a23f546191c1acd0b48945a3b0bf1d2c27778820"

  url_format "/media/:job/:name"

  if Rails.env.production?
    datastore :s3,
              bucket_name: 'bodrov_sitepoint',
              access_key_id: ENV['S3_KEY'],
              secret_access_key: ENV['S3_SECRET'],
              url_scheme: 'https'
  else
    datastore :file,
              root_path: Rails.root.join('public/system/dragonfly', Rails.env),
              server_root: Rails.root.join('public')
  end
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
