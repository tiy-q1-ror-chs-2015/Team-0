class MemosController < ApplicationController
  def index
    @user = User.find current_user
    @memos = @user.memos
  end

  def new
    @user = User.find current_user.id
    @memo = Memo.new
  end

  def create
    @user = User.find current_user
    @memo = @user.memos.new(memo_params)
    if @memo.save
    flash[:notice] = 'Memo was successfully added.'
    redirect_to root_path
    else
      flash[:error] = "Memo was NOT added."
      render :new 
    end
  end

  def show
    set_memo
  end
  def edit
    set_memo
  end
  def update
    @user = User.find current_user
    set_memo
    @user.memos.update_attributes memo_params
    if @user.memos.update_attributes memo_params
      flash[:notice] = 'Memo was successfully added.'
      redirect_to user_memo_path(@user, @memo)
    else
      flash[:error] = "Memo was NOT added."
      render :edit
    end
  end
  def destroy
    set_memo
    @memo.destroy
    redirect_to root_path
  end
private
  def set_memo
    @memo = Memo.find(params[:id])
  end 

  def memo_params
    params.require(:memo).permit(
      :name,
      :content,
      :user_id
      )
  end
end