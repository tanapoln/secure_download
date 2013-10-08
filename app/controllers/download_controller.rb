class SecureDownload::DownloadController < ActionController::Base
  def download
    model = params[:model]
    field = params[:field]
    id = params[:id]

    begin
      cls = model.constantize
      obj = cls.find(id.to_i)
      upload_field = obj.send(field.to_sym) || not_found
    rescue NameError, ActiveRecord::RecordNotFound, NoMethodError
      not_found
    end
    
    do_ability = "download_#{field}".to_sym
    disposition = params.include?(:view) ? 'inline': 'attachment'
    return send_file(absolute_file_path(upload_field), x_sendfile: true, disposition: disposition) if can? do_ability, obj

    not_found
  end

  private
    def absolute_file_path(carrierwave_obj)
      carrierwave_obj.current_path
    end

    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end
end