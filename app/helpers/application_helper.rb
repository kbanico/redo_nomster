module ApplicationHelper

  def profile_avatar_select(user)

    if user.avatar.present?

      return image_tag user.avatar, id: 'image-preview', class: "img-fluid rounded-circle profile-image"
    else
      return image_tag 'user.png', id:'image-preview', class: "img-fluid rounded-circle profile-image"
    end


  end

end
