class AdminFeedbackQuery
  attr_accessor :initial_scope

  def initialize(initial_scope)
    @initial_scope = initial_scope
  end

  def call(params)
    scoped = search(initial_scope, params[:search])
    scoped = order_desc(scoped)
    scoped = paginate(scoped, params[:page])
    scoped
  end

  private

  def search(scoped, query = nil)
    query ? scoped.where("text ILIKE ?", "%#{query}%") : scoped
  end

  def order_desc(scoped)
    scoped.order(created_at: :desc)
  end

  def paginate(scoped, page = 1)
    scoped.page(page)
  end
end
