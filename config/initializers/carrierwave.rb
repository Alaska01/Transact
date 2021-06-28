CarrierWave.configure do |config|

    config.fog_credentials = {
      provider:              'AWS',                            # required
      aws_access_key_id:     ENV["AKIA5JO7JVRCB5LJZPMP"],            # required
      aws_secret_access_key: ENV["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"],            # required
      region:                'us-east-1'                       # to match the carrierwave and bucket region
    }
    config.fog_directory = ENV["AWS_BUCKET"]                   # required
    config.fog_public    = false
    config.cache_dir     = "#{Rails.root}/tmp/uploads"         # To let CarrierWave work on Heroku
    config.storage       = :fog
  
  end
  