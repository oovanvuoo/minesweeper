class Admin::MineBoardsController < ApplicationController
  before_action :set_mine_board, only: [:show, :destroy]
  def index
    @mine_boards = MineBoardQuery.new.filters(params)
    @pagy, @mine_board = pagy(@mine_boards)
   
  end

  def new
    redirect_to admin_menu_path
  end

  def create
    # @mine_board ||= MineBoard.new(mine_board_params)
    if params[:commit] == 'Save'
      if @mine_board.save

        return redirect_to admin_mine_boards_path, notice: 'Mine board was successfully created.'
      else
        return redirect_to new_admin_mine_board_path(p: mine_board_params)
      end 
    end
  rescue => e
    return redirect_to admin_mine_boards_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @mine_board.destroy!
    redirect_to admin_mine_boards_path
  end

  def menu
    if (params[:commit] == 'Generate')
      @mine_board = MineBoard.new(mine_board_params)
      @mine_board.generate_board
      @mine_board.save
      @board_matrix = @mine_board.full_board
      @show_data = params[:commit]
      respond_as_js
    elsif (params[:commit] == 'Show')
      _, @mine_boards = pagy(MineBoardQuery.new.filters({email: mine_board_params[:email]}), page: 1, items: 10)
      @show_data = params[:commit]
      respond_as_js
    elsif (params[:commit] == 'Save')
      create
    else
      @mine_board = MineBoard.new
      @show_data = nil
      respond_as_js
    end

    
  end 

  def respond_as_js
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def mine_board_params 
    params.require(:mine_board).permit(:email, :width, :height, :mine_number)
  end

  def set_mine_board
    @mine_board = MineBoardQuery.new.get_by_id(params[:id])
    @board_matrix = @mine_board.full_board
  end
end