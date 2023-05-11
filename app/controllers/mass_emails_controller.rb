class MassEmailsController < ApplicationController
  def index
    matching_mass_emails = MassEmail.all

    @list_of_mass_emails = matching_mass_emails.order({ :created_at => :desc })

    render({ :template => "mass_emails/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_mass_emails = MassEmail.where({ :id => the_id })

    @the_mass_email = matching_mass_emails.at(0)

    render({ :template => "mass_emails/show.html.erb" })
  end

  def create
    the_mass_email = MassEmail.new
    the_mass_email.admin_id = params.fetch("query_admin_id")
    the_mass_email.subject = params.fetch("query_subject")
    the_mass_email.context = params.fetch("query_context")
    the_mass_email.sent_at = params.fetch("query_sent_at")

    if the_mass_email.valid?
      the_mass_email.save
      redirect_to("/mass_emails", { :notice => "Mass email created successfully." })
    else
      redirect_to("/mass_emails", { :alert => the_mass_email.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_mass_email = MassEmail.where({ :id => the_id }).at(0)

    the_mass_email.admin_id = params.fetch("query_admin_id")
    the_mass_email.subject = params.fetch("query_subject")
    the_mass_email.context = params.fetch("query_context")
    the_mass_email.sent_at = params.fetch("query_sent_at")

    if the_mass_email.valid?
      the_mass_email.save
      redirect_to("/mass_emails/#{the_mass_email.id}", { :notice => "Mass email updated successfully."} )
    else
      redirect_to("/mass_emails/#{the_mass_email.id}", { :alert => the_mass_email.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_mass_email = MassEmail.where({ :id => the_id }).at(0)

    the_mass_email.destroy

    redirect_to("/mass_emails", { :notice => "Mass email deleted successfully."} )
  end
end
