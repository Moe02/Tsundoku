class Request < ApplicationRecord
  belongs_to :user
  belongs_to :user_book
  has_one :book, through: :user_book
end
