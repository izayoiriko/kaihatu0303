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
    
  end
  
  def update
    
    if @user.update_attributes(task_params)
      flash[:success] = "タスクを更新しました。"
      redirect_to user_task_path(@user, task)
    else
      render :edit
    end
  end
  
  private
  
    def set_user
      @user = User.find(params[:user_id])
    end
    
    def task_params
      params.require(:task).permit(:work, :details, :user_id)
    end
end
