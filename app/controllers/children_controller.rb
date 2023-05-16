class ChildrenController < ApplicationController
  def index
    @list_of_children = Child.all.order(created_at: :desc)
    render({ template: "children/index.html.erb" })
  end

  def show
    the_id = params[:id]
    matching_children = Child.where(id: the_id)
    @the_child = matching_children.first
    render template: "children/show.html.erb"
  end

  def create
    the_child = Child.new(child_params)
  
    if the_child.save
      # Process the uploaded images
      if params[:child][:images].present?
        params[:child][:images].each do |image|
          the_child.images.attach(image)
        end
      end
  
      redirect_to children_path, notice: "Child created successfully."
    else
      redirect_to children_path, alert: the_child.errors.full_messages.to_sentence
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
  
  def destroy
    the_child = Child.find(params[:id])
    the_child.destroy
  
    redirect_to children_path, notice: "Child deleted successfully."
  end

  private

  def child_params
    params.require(:child).permit(:first_name, :last_name, :date_of_birth, :parent_id, images: [])
  end
  
  
  def image_params
    params.require(:child).permit(images: [])
  end
end
