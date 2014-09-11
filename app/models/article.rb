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
end
