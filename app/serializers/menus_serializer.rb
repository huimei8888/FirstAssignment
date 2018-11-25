class MenusSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :price, :category_id, :position, :photo_url
  
  def photo_url
    if object.photo.attached?
      rails_blob_path(object.photo, only_path: true)
    else
      "no image"
    end
  end
end
