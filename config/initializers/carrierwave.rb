require 'carrierwave/mongoid'
CarrierWave.configure do |config|
  config.storage = :grid_fs
end

