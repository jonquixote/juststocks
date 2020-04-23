class HoldingsCurrentsController < ApiController
  before_action :set_holdings_current, only: [:show, :update, :destroy]

  # GET /holdings_currents
  def index
    @holdings_currents = HoldingsCurrent.all

    render json: @holdings_currents
  end

  # GET /holdings_currents/1
  def show
    render json: HoldingsCurrent.where(strategy_name: params[:id])
  end

  # POST /holdings_currents
  def create
    @holdings_current = HoldingsCurrent.new(holdings_current_params)

    if @holdings_current.save
      render json: @holdings_current, status: :created, location: @holdings_current
    else
      render json: @holdings_current.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /holdings_currents/1
  def update
    if @holdings_current.update(holdings_current_params)
      render json: @holdings_current
    else
      render json: @holdings_current.errors, status: :unprocessable_entity
    end
  end

  # DELETE /holdings_currents/1
  def destroy
    @holdings_current.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holdings_current
      @holdings_current = HoldingsCurrent.friendly.find_by(strategy_name: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def holdings_current_params
      params.require(:holdings_current).permit(:ticker, :weight, :return, :return_dollars, :rank, :shares, :avg_share_cost, :current_price, :value, :days_held, :sector, :strategy_name, :strategy_id)
    end
end
