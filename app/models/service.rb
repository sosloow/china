class Service < ActiveRecord::Base
  translates :name, :body do
    validates :name, presence: true
    validates :body, presence: true
  end
  has_many :service_translations
  accepts_nested_attributes_for :service_translations
end

