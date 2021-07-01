class LogsController < ApplicationController
  before_action :logged_in_user

  def index
    @logs = Log.includes(:groups).where(author_id: current_user.id)
    @logs = @logs.order('created_at DESC').paginate(page: params[:page], per_page: 15)
  end

  def individual
    @logs = Log.includes(:groups).where(author_id: current_user.id)
    @logs = @logs.order('created_at DESC').reject { |log| log.groups.exists? }
    
  end

  def excluding
    @logs = Log.includes(:groups).where(author_id: current_user.id)
    @logs = @logs.select { |log| log.groups.exists? }
  end

  def new
    @log = Log.new
    @groups = Group.all
  end

  def create
    @log = current_user.logs.build(log_params)
    if @log.save
      flash[:success] = 'Your log has been created.'
      @log_group = LogGroup.new(log_id: @log.id, group_id: group_params[:group_id])
      flash[:success] = 'Your log for this group has been created.' if @log_group.save
      redirect_to logs_path
    else
      flash.now[:danger] = 'Please try again.'
      render 'new'
    end
  end

  private

  def log_params
    params.require(:log).permit(:name, :amount)
  end

  def group_params
    params.require(:log).permit(:group_id)
  end
end
