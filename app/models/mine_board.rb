class MineBoard < ApplicationRecord
  has_many :mine_board_details, -> { where('x IS NOT NULL AND y IS NOT NULL')}


  def generate_board #width, height, mine_number
    width = self.width.to_i
    height = self.height.to_i
    mine_number = self.mine_number.to_i

    return if width < 1 || height < 1 || mine_number < 1

    mine_number.times do 
      gen_new_mine(width, height)
    end
    self.mine_board_details
  end

  def full_board
    board = Array.new(width) {Array.new(height) } 
    self.mine_board_details.each do |mine|
      board[mine.x][mine.y] = 1
    end
    board
  end

  def board_size
    
    width = self.width.to_s
    height = self.height.to_s
    x = width.present? && height.present? ? " x " : ""
    width + x + height
  end

  private
  
  def random(number)
    rand(0..number-1)
  end

  def gen_new_mine(width, height)
    max_try = width * height
    (1..max_try).each do 
      xx = random(width)
      yy = random(height)
      return if new_mine_ok?(xx, yy)
    end

  end

  def new_mine_ok?(xx, yy)
    return if self.mine_board_details.detect{|mine| mine.x == xx && mine.y == yy}.present?

    self.mine_board_details.new(x: xx, y: yy)
  end
end
