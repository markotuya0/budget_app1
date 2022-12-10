module GroupsHelper
  def total_amout(group)
    @sum = group.entities.sum(:amount)
    @sum
  end
end
