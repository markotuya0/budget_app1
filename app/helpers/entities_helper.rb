module EntitiesHelper
  def total_amout_entity(_group_id)
    @group = Group.find(params[:group_id])
    @sum = @group.entities.sum(:amount)
    @sum
  end
end
