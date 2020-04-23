class HoldingsHistoricalsController < ApiController
  before_action :set_holdings_historical, only: [:show, :update, :destroy]

  # GET /holdings_historicals
  def index
    @holdings_historicals = HoldingsHistorical.all

    render json: @holdings_historicals
  end

  # GET /holdings_historicals/1
  def show
    render json: HoldingsHistorical.where(strategy_name: params[:id])
  end

  # POST /holdings_historicals
  def create
    @holdings_historical = HoldingsHistorical.new(holdings_historical_params)

    if @holdings_historical.save
      render json: @holdings_historical, status: :created, location: @holdings_historical
    else
      render json: @holdings_historical.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /holdings_historicals/1
  def update
    if @holdings_historical.update(holdings_historical_params)
      render json: @holdings_historical
    else
      render json: @holdings_historical.errors, status: :unprocessable_entity
    end
  end

  # DELETE /holdings_historicals/1
  def destroy
    @holdings_historical.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holdings_historical
      @holdings_historical = HoldingsHistorical.friendly.find_by(strategy_name: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def holdings_historical_params
      params.require(:holdings_historical).permit(:historical_link, :historical_link_href, :ticker, :cost, :open_date, :number_of_days, :pct_historical, :strategy_name, :strategy_id)
    end
end
