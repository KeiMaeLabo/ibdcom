class User < ApplicationRecord
  has_many :posts
  has_many :comments
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: { case_sensitive: true }, length: { maximum: 10}
  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates :age, presence: true
  validates :sex, presence: true
  validates :disease, presence: true
  validates :history, presence: true
  validates :status, presence: true
  validates :word, length: { maximum: 16}
  validates :sns, format: { with: /https.+/ }, allow_blank: true
  devise :validatable, password_length: 6..50

  # def update_without_current_password(params, *options)
  #   params.delete(:current_password)

  #   if params[:password].blank? && params[:password_confirmation].blank?
  #     params.delete(:password)
  #     params.delete(:password_confirmation)
  #   end

  #   result = update_attributes(params, *options)
  #   clean_up_passwords
  #   result
  # end

end
