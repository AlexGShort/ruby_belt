class MembershipsController < ApplicationController

  def create
    if Membership.where({ user_id: params[:user_id], group_id: params[:group_id]}).exists?
      redirect_to "/groups/#{params[:group_id]}"
    else
      user = User.find(params[:user_id])
      group = Group.find(params[:group_id])
      Membership.create(user: user, group: group)
      redirect_to "/groups/#{params[:group_id]}"
    end
  end

  def delete
    membership = Membership.where({ user_id: params[:user_id], group_id: params[:group_id]})
    membership.destroy_all
    redirect_to "/groups/#{params[:group_id]}"
  end
end
