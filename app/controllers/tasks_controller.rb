class TasksController < ApplicationController
before_action :set_user
  
  def index
    @task = @user.tasks.order(created_at: :desc)
  end
  
  def show
    @task = Task.find(params[:id])
    
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
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = "タスクを更新しました。"
      redirect_to user_task_url
    else
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
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
    
    def logged_in_user
    end
    
    def current_user
      redirect_to(root_url) unless current_user?(@user)
    end
end
