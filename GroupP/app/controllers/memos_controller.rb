class MemosController < ApplicationController
  def index
    @memos = Memo.all
  end
  def new
    @memo = Memo.new
  end
  def create
    @memo = Memo.new(memo_params)
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
    set_memo
    @memo.update_attributes memo_params
      if @memo.update_attributes memo_params
      flash[:notice] = 'Memo was successfully added.'
      redirect_to memo_path(@memo)
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