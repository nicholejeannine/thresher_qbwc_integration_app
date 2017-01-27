class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :tree, :projects]

# GET /customers
  def index
    if params[:is_active]
      # Since is_active is a string, check the string value
      if params[:is_active] === 'true'
        @customers = Customer.companies.active.order(:name)
      elsif params[:is_active] === 'false'
        @customers = Customer.companies.inactive.order(:name)
      elsif params[:is_active] === 'all'
        @customers = Customer.companies.all.order(:name)
      end
      # Otherwise ?
    end
    # If no params just render all active companies by default
    # @customers = Customer.includes(:projects).active.order(:full_name)
    @customers = Customer.active.companies.order(:full_name)
  end

# GET /customers/:full_name
  def show
  end

# GET /customers/:full_name/tree
  def tree
  end

  def projects
    @projects = @customer.all_projects.order(:name)
  end

  def test
    @customers = Customer.find_by(full_name: 'Google').descendants.order( :full_name)
    render :index
  end
  private

  def set_customer
    @customer = Customer.find_by(full_name: params[:full_name])
  end

    # Potentially searchable params for now here
  def customer_params
      params.require(:customer).permit(:name, :full_name, :is_active, :parent_id, :sublevel, :company_name)
  end

end
