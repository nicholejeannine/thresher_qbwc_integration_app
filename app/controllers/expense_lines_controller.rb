class ExpenseLinesController < ApplicationController
  before_action :set_expense_line, only: [:show]

  # GET /expense_lines
  def index
    @expense_lines = ExpenseLine.all
  end

  # GET /expense_lines/1
  def show
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense_line
      @expense_line = ExpenseLine.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def expense_line_params
      params.require(:expense_line).permit(:account_id, :amount, :tax_amount, :memo, :customer_id, :class_id, :sales_tax_code_id, :billable_status, :sales_rep_id, :data_ext_id)
    end
end
