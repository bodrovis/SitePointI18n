class SettingsController < ApplicationController
  def change_locale
    l = params[:locale].to_s.strip
    l = I18n.default_locale unless ['ru', 'en'].include?(l)
    cookies.permanent[:educator_locale] = l.to_s
    redirect_to request.referer || root_url
  end
end