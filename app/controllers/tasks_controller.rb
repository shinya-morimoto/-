class TasksController < ApplicationController
  before_action :set_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @user = User.find(params[:user_id])
    @tasks = @user.tasks
  end
  
  def show
  end
  
  def new
    @task = @user.tasks.new
  end
  
  def create
    @task = @user.tasks.new(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました！"
      redirect_to user_tasks_url(use_id:@user)
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @task.update_attributes(task_params)
      flash[:success] = "タスクを更新しました。"
      redirect_to user_task_path(@user,@task)
    else
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    flash[:success] = "タスクを削除しました。"
    redirect_to user_tasks_path(@user)
  end
  
  
  private
  
    def task_params
      params.require(:task).permit(:name, :content)
    end
    
    def set_user
      @user = User.find(params[:user_id])
    end
    
    def set_task
      @task = Task.find(params[:id])
    end
  
end