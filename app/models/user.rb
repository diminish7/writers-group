# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :token_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable

  validates :name, presence: true

  before_create :generate_uuid, unless: :uuid?

  protected

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end
end
