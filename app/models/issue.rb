class Issue < ApplicationRecord
  cti_base_class

  belongs_to :user
  belongs_to :product

  has_one :bug
  has_one :feature_request

  enum status: { opened: 0, closed: 1 }

  validates :title, presence: true
end
