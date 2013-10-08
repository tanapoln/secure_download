# require 'active_support/core_ext/object/blank'
# require 'active_support/core_ext/class/attribute'
# require 'active_support/concern'

module SecureDownload
end

if defined?(Rails)
  module SecureDownload
    class Railtie < Rails::Railtie
      # initializer "secure_download.active_record" do
      ActiveSupport.on_load :action_controller do
        require 'secure_download/routes'
        require_relative '../app/controllers/download_controller'
        ActiveSupport.on_load :after_initialize do
          require 'secure_download/carrierwave_extends'
        end
      end
    end
  end
end