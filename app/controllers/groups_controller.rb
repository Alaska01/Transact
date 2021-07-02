class GroupsController < ApplicationController
  def index
    @groups = Group.all.order('name ASC').paginate(page: params[:page], per_page: 15)
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    @group.image.attach(params[:group][:image])
    if @group.save
      flash[:success] = 'Your group has been created.'
      redirect_to groups_path
    else
      flash.now[:danger] = 'Please try again.'
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name, :image)
  end
end
