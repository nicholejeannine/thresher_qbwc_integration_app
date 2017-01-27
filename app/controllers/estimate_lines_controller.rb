class EstimateLinesController < ApplicationController
  before_action :set_estimate_line, only: [:show, :edit, :update, :destroy]

  # GET /estimate_lines
  def index
    @estimate_lines = EstimateLine.all
  end

  # GET /estimate_lines/1
  def show
  end

  # GET /estimate_lines/new
  def new
    @estimate_line = EstimateLine.new
  end

  # GET /estimate_lines/1/edit
  def edit
  end

  # POST /estimate_lines
  def create
    @estimate_line = EstimateLine.new(estimate_line_params)

    if @estimate_line.save
      redirect_to @estimate_line, notice: 'Estimate line was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /estimate_lines/1
  def update
    if @estimate_line.update(estimate_line_params)
      redirect_to @estimate_line, notice: 'Estimate line was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /estimate_lines/1
  def destroy
    @estimate_line.destroy
    redirect_to estimate_lines_url, notice: 'Estimate line was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estimate_line
      @estimate_line = EstimateLine.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def estimate_line_params
      params.require(:estimate_line).permit(:estimate_id, :item_id, :item_full_name, :desc, :quantity, :unit_of_measure, :override_uom_set_id, :override_uom_set_full_name, :rate, :rate_percent, :amount, :inventory_site_id, :inventory_site_full_name, :inventory_site_location_id, :inventory_site_location_full_name, :sales_tax_code_id, :sales_tax_code_full_name, :markup_rate, :markup_rate_percent)
    end
end
