class ChildrenController < ApplicationController
  def index
    @list_of_children = Child.all.order(created_at: :desc)
    render({ template: "children/index.html.erb" })
  end


  def show
    the_id = params[:id] # Use params[:id] instead of params[:path_id]
  
    matching_children = Child.where(id: the_id)
    @the_child = matching_children.first
  
    render template: "children/show.html.erb"
  end

  def create
    the_child = Child.new
    the_child.first_name = params.fetch("query_first_name")
    the_child.last_name = params.fetch("query_last_name")
    the_child.date_of_birth = params.fetch("query_date_of_birth")
    the_child.parent_id = params.fetch("query_parent_id")

    if the_child.valid?
      the_child.save
      redirect_to("/children", { :notice => "Child created successfully." })
    else
      redirect_to("/children", { :alert => the_child.errors.full_messages.to_sentence })
    end
  end

  def update
    the_child = Child.find(params[:id])
  
    if the_child.update(child_params)
      redirect_to child_path(the_child), notice: "Child updated successfully."
    else
      # Handle validation errors if necessary
    end
  end
  
  private
  
  def child_params
    params.require(:child).permit(:first_name, :last_name, :date_of_birth, :parent_id)
  end

  def destroy
    the_child = Child.find(params[:id])
    the_child.destroy
  
    redirect_to children_path, notice: "Child deleted successfully."
  end
end
