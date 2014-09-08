# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  image_uid  :string(255)
#

class Article < ActiveRecord::Base
  translates :title, :body, :image_uid, fallbacks_for_empty_translations: true

  dragonfly_accessor :image

  validates_size_of :image, :maximum => 100.kilobytes

  validates_property :format, :of => :image, :in => [:jpeg, :jpg, :png, :bmp], :case_sensitive => false
end
