class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :set_locale


    protected

        def after_sign_in_path_for(resource)
            set_locale_from_cookie
            super
        end

        def set_locale
            I18n.locale = params[:locale] || cookies[:locale] || I18n.default_locale
            cookies[:locale] = I18n.locale if params[:locale].present?
        end

        def set_locale_from_cookie
            I18n.locale = cookies[:locale] || I18n.default_locale
        end
end
