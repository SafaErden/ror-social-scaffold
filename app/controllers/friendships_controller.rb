class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def friendship_request
    @user_to_be_friend = User.find_by(id: params[:user])
    @friendship = Friendship.new(user_id: current_user.id, friend_id: @user_to_be_friend.id, confirmed: false)

    if @friendship.save
      redirect_to users_path, notice: 'You successfully sent a friendship request.'
    else
      redirect_to users_path, notice: 'Something went wrong.'
    end
  end

  def confirm
    @user = User.find_by(id: params[:user])

    if current_user.confirm_friend(@user)
      @friendship = Friendship.new(user_id: current_user.id, friend_id: @user.id, confirmed: true)
      @friendship.save
      redirect_to users_path, notice: "You are now friends with #{@user.name}."
    else
      redirect_to users_path, notice: 'Something went wrong.'
    end
  end
end
