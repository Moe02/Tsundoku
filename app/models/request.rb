class Request < ApplicationRecord
  belongs_to :user
  belongs_to :user_book
  has_one :book, through: :user_book

  validates :start_date, presence: true
  validates :end_date, presence: true
  
  def pending?
    status == "pending"
  end

  def active?
    status == "accepted"
  end
end
