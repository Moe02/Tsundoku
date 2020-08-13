class Request < ApplicationRecord
  belongs_to :user
  belongs_to :user_book
  validates :start_date, presence: true
  validates :end_date, presence: true
end
