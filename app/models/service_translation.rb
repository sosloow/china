class ServiceTranslation < ActiveRecord::Base
  belongs_to :service

  def locale_enum
    I18n.available_locales
  end
end
