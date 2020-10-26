class Startup < ApplicationRecord
  mount_uploader :decription_video, DecriptionUploader
  mount_uploader :banner, BannerUploader

  validates :address, presence: true, null: false
  validates :name, presence: true, null: false
  validates_length_of :resume, minimum: 150, message: 'votre résumé  est trop court (doit contenir 150 caractères au moins'
  validates :resume, presence: true, null: false
  validates :contact, presence: true, null: false

  has_one_attached :logo

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy

  scope :name_search,  -> (text_search) {where("name LIKE ?", "%#{text_serach}%")}

  def logo_thumbnail
    if logo.attached?
      logo.variant(resize: '330x80!').processed
    else
      '/default_logo.png'
    end
  end
  def banner_thumbnail
    unless banner.present?
      '/banner.gif'
    else
      banner
    end
  end
  def description_thumbnail
    unless decription_video.present?
      '/video.mp4'
    else
      decription_video
    end
  end
end
