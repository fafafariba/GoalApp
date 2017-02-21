class GoalsController < ApplicationController
  before_action :allow_changes, only: [:edit, :update, :destroy]

  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user

    if @goal.save
      redirect_to user_url(@goal.user)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])

    if @goal
      redirect_to user_url(@goal.user)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    flash.now[:notice] = "Goal has been deleted."
    render :new
  end
  
  private

  def goal_params
    params.require(:goal).permit(:name, :description, :visibility, :status)
  end

  def allow_changes
    unless current_user == @goal.user
      flash.now[:errors] = "You cannot only make changes to your own goals"
    end
  end
end
