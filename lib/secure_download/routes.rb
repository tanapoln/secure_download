module ActionDispatch::Routing
  class Mapper
    def secure_download_map(options={})
      options = {:path => 'secure_download'}.merge(options)
      get "#{options[:path]}/:model/:field/:id" => 'secure_download/download#download', :as => 'secure_download'
    end
  end
end