class GroupsController < ApplicationController
  def index
    @groups = Group.where(author: current_user)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.author_id = current_user.id
    if @group.save
      flash[:success] = 'Group was successfully created.'
      redirect_to groups_path
    else
      flash[:error] = 'Group was not created.'
      render 'new'
    end
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
