module UsersHelper
  def user_avatar(user)
    return user.avatar.url if user.avatar?
    asset_url('user.png')
  end
end
