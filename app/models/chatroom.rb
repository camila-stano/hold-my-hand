class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_one_attached :photo
  has_many :chat_members, dependent: :destroy
  has_many :users, through: :chat_members
end
