class SecureDownloadController < ApplicationController
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
    p upload_field.hello_world
    do_ability = "download_#{field}".to_sym
    return send_file(absolute_file_path(upload_field), x_sendfile: true) if can? do_ability, obj

    not_found
  end

  private
    def absolute_file_path(carrierwave_obj)
      #Rails.root.join('secure_download', carrierwave_obj.current_path)
      p carrierwave_obj.current_path
      carrierwave_obj.current_path
    end

    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end
end