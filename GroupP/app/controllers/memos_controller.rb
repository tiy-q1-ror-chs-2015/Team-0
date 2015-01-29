class MemosController < ApplicationController
  def index
    @memos = Memo.all
  end
  def new
    @memo = Memo.new
  end
  def create
    @memo = Memo.new(memo_params)
    @memo.save
    redirect_to root_path
  end
  def show
    set_memo
  end
  def edit
  end
  def destroy

  end
private
  def set_memo
    @memo = Memo.find(params[:id])
  end 
  def memo_params
    params.require(:memo).permit(:name, :content)
  end
end
