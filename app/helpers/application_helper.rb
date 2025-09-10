module ApplicationHelper
  include Pagy::Frontend

    def avatar_image(user, size: 50, **opts)
    if user&.avatar&.attached? && user.avatar.blob&.persisted?
      image_tag user.avatar.variant(resize_to_fill: [size, size]), **opts
    else
      image_tag "default-avatar.png", width: size, height: size, **opts
    end
  end

end
