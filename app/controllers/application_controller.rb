class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  
  def set_locale
    if params[:locale] && I18n.available_locales.include?(params[:locale].to_sym)
      cookies['locale'] = { :value => params[:locale], :expires => 1.year.from_now }
      I18n.locale = params[:locale].to_sym
    elsif cookies['locale'] && I18n.available_locales.include?(cookies['locale'].to_sym)
      I18n.locale = cookies['locale'].to_sym
    elsif ! extract_locale_from_accept_language_header.blank? && I18n.available_locales.include?(extract_locale_from_accept_language_header.to_sym)
      I18n.locale = extract_locale_from_accept_language_header
      cookies['locale'] = { :value => params[:locale], :expires => 1.year.from_now }
    else 
      I18n.locale = :fr
    end
    puts I18n.locale
  end

  protected
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == "lamaisoncreole" && password == ENV['ALL_CONTACTS']
      end
    end

  private
    def extract_locale_from_accept_language_header
      @http_locale ||= request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end
end

