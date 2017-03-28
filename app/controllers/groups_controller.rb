class GroupsController < ApplicationController

  def index
    @user = User.find(current_user)
    @groups = Group.all
  end

  def create
    user = current_user
    puts "Current user: #{current_user}"
    group = Group.create(name: params[:name], description: params[:description], owner: user)
    if group.valid?
      Membership.create(user:user, group:group)
      redirect_to '/groups'
    else
      flash[:errors] = group.errors.full_messages
      redirect_to '/groups'
    end
  end

  def show
    @group = Group.find(params[:group_id])
  end

  def delete
    group = Group.find(params[:group_id])
    members = Membership.where({ group:group.id})
    members.delete_all
    group.destroy
    redirect_to '/groups'
  end
end
