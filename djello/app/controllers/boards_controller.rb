class BoardsController < ApplicationController
  
  before_action :authenticate_user!

  def index
    puts "=================action index in board ctrl================"
    puts current_user.boards
    @boards = current_user.boards
    respond_to do |format|
      format.json {render json: @boards}
    end
  end

  def create
    @board = Board.new(params_list)

    if @board.save
      puts "Saved board"
      
    end
  end


  private

  def params_list
    param.require(:board).permit(:title, :user_id, :id)
  end
end
