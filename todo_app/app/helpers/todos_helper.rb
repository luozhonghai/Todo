module TodosHelper
  def new_line(s)
    raw(h(s).gsub("\n", "<br />"))
  end
end
