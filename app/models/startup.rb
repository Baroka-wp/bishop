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

  scope :name_search, ->(_text_search) { where('name LIKE ?', "%#{text_serach}%") }

  def logo_thumbnail
    if logo.attached?
      logo.variant(resize: '330x80!').processed
    else
      '/default_logo.png'
    end
  end

  def banner_thumbnail
    if banner.present?
      banner
    else
      '/banner.gif'
    end
  end

  def description_thumbnail
    if decription_video.present?
      decription_video
    else
      'https://www.youtube.com/watch?v=NGi5ontIT3w'
    end
  end
end
