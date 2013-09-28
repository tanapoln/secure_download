require 'carrierwave/uploader'

module CarrierWave
  module Uploader
    class Base
      include ActionView::Helpers
      include ActionDispatch::Routing
      include Rails.application.routes.url_helpers
      def secure_url
        url_for :controller => 'secure_download', :action => 'download', :model => 'Work', :field => 'file', :id => 17
      end
    end
  end
end
