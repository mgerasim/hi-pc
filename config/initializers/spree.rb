#encoding: utf-8
# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to override the default site name.
  config.site_name = "Интернет-ветрина автомобильных бортовых компьютеров"
  config.use_s3 = false
  config.s3_bucket = 'hipc'
  config.s3_access_key = "AKIAJPNLN2VOL4H5CH5A"
  config.s3_secret = "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"
  
  config.attachment_url = ":s3_eu_url"
  config.s3_host_alias = "s3-eu-west-1.amazonaws.com"
end

Spree.user_class = "Spree::User"

Paperclip.interpolates(:s3_eu_url) do |attachment, style|
  "#{attachment.s3_protocol}://#{Spree::Config[:s3_host_alias]}/#{attachment.bucket_name}/#{attachment.path(style).gsub(%r{^/}, "")}"
 end
