class TasksController < ApplicationController
before_action :set_user
before_action :set_task, only: [:show, :edit, :update, :destroy]
before_action :logged_in_user
before_action :correnct_user

  def index
    @task = @user.tasks.order(created_at: :desc)
  end
  
  def show
    #
    
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = @user.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスク新規作成しました。"
      redirect_to user_tasks_url @user
    else
      render :new
    end
  end
  
  def edit
    #
  end
  
  def update
    #
    if @task.update_attributes(task_params)
      flash[:success] = "タスクを更新しました。"
      redirect_to user_task_url
    else
      render :edit
    end
  end
  
  def destroy
    #
    @task.destroy
    flash[:success] = "#{@task.work}のデータを削除しました。"
    redirect_to user_tasks_url
  end
  
  private
  
    def task_params
      params.require(:task).permit(:work, :details, :user_id)
    end
    
    # beforeフィルター
    
    def set_user
      @user = User.find(params[:user_id])
    end
    
    # ログイン済みかどうか
    def logged_in_user
      unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      resirect_to login_url
      end
    end

    
    def correct_user
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to root_url unless current_user.admin?
    end
    
    # 管理権限者、または現在ログインしているユーザーを許可します。
    def admin_or_current_user
      @user = User.find(parsms[:user_id]) if @user.blank?
      unless current_user?(@user) || current_user.admin?
        flash[:danger] = "編集権限がありません。"
        resirect_to(root_url)
      end
    end
end
