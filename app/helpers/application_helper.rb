module ApplicationHelper
  def alert_for(flash_type)
    { success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end
end

def form_image_select(pic)
  return image_tag pic.image.url, id: 'image-preview', style: 'height:100%;width:700px', class: 'img-responsive' if pic.image.present?
  image_tag 'noimage.jpg', id: 'image-preview', class: 'img-responsive'
end

def profile_avatar_select(user)
  return image_tag user.avatar.url.to_s, id: 'image-preview', class: 'img-responsive img-circle profile-image' if user.avatar.present?
  image_tag 'default-avatar.jpg', id: 'image-preview', class: 'img-responsive img-circle profile-image'
end
