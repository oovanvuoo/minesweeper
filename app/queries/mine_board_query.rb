class MineBoardQuery
  def initialize
    @boards = MineBoard.all
  end

  def filters(params = {})
    @boards = filter_by_keyword(params[:keyword])
    @boards = filter_by_email(params[:email])
    @boards = filter_by_width(params[:width])
    @boards = filter_by_height(params[:height])
  end

  def get_by_id(id)
    @boards.find_by_id(id)
  end

  private

  def filter_by_keyword(keyword)
    return @boards if keyword.blank?

    @boards.where('email LIKE :keyword', keyword: "%#{keyword}%")
  end

  def filter_by_email(email)
    return @boards if email.blank?

    @boards.where(email: email)
  end

  def filter_by_width(width)
    return @boards if width.blank?

    @boards.where(width: width)
  end

  def filter_by_height(height)
    return @boards if height.blank?

    @boards.where(height: height)
  end
  
end