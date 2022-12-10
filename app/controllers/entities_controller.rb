class EntitiesController < ApplicationController
  def index
    @entities = Entity.where(group_id: params[:group_id]).order(created_at: :desc)
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.author_id = current_user.id
    @group = Group.find(params[:group_id])
    @entity.group_id = @group.id
    if @entity.save
      flash[:success] = 'Entity was successfully created.'
      redirect_to group_entities_path
    else
      flash[:error] = 'Entity was not created.'
      render 'new'
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
