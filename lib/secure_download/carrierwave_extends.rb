require 'carrierwave/uploader'
require 'carrierwave/mount'

module CarrierWave
  module Uploader
    class Base
      include ActionView::Helpers
      include ActionDispatch::Routing
      include Rails.application.routes.url_helpers
    end
  end

  module Mount
    class Mounter
      alias_method :old_uploader, :uploader

      def uploader
        old_uploader
        @uploader.instance_eval <<-RUBY, __FILE__, __LINE__+1
          def secure_url
            url_for :controller => 'secure_download/download', :action => 'download', :model => model.class.name, :field => '#{column}', :id => model.id
          end
        RUBY
        return @uploader
      end
    end
  end
end
