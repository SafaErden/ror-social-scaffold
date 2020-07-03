class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_to_be_friend = User.find_by(id: params[:user])
    @friendship = Friendship.new(user_id: current_user.id, friend_id: @user_to_be_friend.id, confirmed: false)
    @friendship.save
    redirect_to users_path, notice: 'You successfully sent a friendship request.'
  end
end
