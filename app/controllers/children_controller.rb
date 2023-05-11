class ChildrenController < ApplicationController
  def index
    matching_children = Child.all

    @list_of_children = matching_children.order({ :created_at => :desc })

    render({ :template => "children/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_children = Child.where({ :id => the_id })

    @the_child = matching_children.at(0)

    render({ :template => "children/show.html.erb" })
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
    the_id = params.fetch("path_id")
    the_child = Child.where({ :id => the_id }).at(0)

    the_child.first_name = params.fetch("query_first_name")
    the_child.last_name = params.fetch("query_last_name")
    the_child.date_of_birth = params.fetch("query_date_of_birth")
    the_child.parent_id = params.fetch("query_parent_id")

    if the_child.valid?
      the_child.save
      redirect_to("/children/#{the_child.id}", { :notice => "Child updated successfully."} )
    else
      redirect_to("/children/#{the_child.id}", { :alert => the_child.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_child = Child.where({ :id => the_id }).at(0)

    the_child.destroy

    redirect_to("/children", { :notice => "Child deleted successfully."} )
  end
end
