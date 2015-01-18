class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_agency


  def after_sign_in_path_for( resource )
  	if resource.admin?
		return admin_index_path
	else
		return dashboard_index_path	
	end
  	
  end


  def set_flash( msg, code=:success, *objs )
      if flash[code].blank?
        flash[code] = "<p>#{msg}</p>"
      else
        flash[code] += "<p>#{msg}</p>"
      end
      objs.each do |obj|
        obj.errors.each do |error|
          flash[code] += "<p>#{error.to_s}: #{obj.errors[error].join(';')}</p>"
        end
      end
    end


  def set_page_info( args={} )
      @page_info = args
      @page_info[:title] ||= ENV['APP_NAME']
      @page_info[:description] ||= ENV['APP_DESCRIPTION'] 

    end

    private

    def set_agency
      @current_agency = current_user.try( :agency ) || Agency.find_by( id: params[:agency_id] )
    end


end
