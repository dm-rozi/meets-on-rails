module ApplicationHelper
  def user_avatar(user)
    asset_pack_path('media/images/user.jpg')
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"  
  end

  def del_icon
    content_tag 'i', '',  class: "fa fa-times"
  end
end
