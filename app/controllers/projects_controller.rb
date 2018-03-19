class ProjectsController < ApplicationController
  skip_before_action :verify_authenticity_token
  layout false

  def create
    # Take in the parent full name from params
    # Add a new project - get the id
    # Build a new customer add request, using the id to create a new customer (project)
    # Add the QBWC job
    # Render plain "okay"
    #
    # CHECK FULL NAME - IF THERE IS NOT AT LEAST ONE COLON IN THE FULL NAME REJECT THE REQUEST
    parent_full_name = params[:full_name]
    request = Project.customer_add_request(parent_full_name)
    QBWC.add_job("AddProject", true, '', request)
    render plain: "OK"
  end
end