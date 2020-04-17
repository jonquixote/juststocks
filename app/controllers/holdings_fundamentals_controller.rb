class HoldingsFundamentalsController < ApiController
  before_action :set_holdings_fundamental, only: [:show, :update, :destroy]

  # GET /holdings_fundamentals
  def index
    @holdings_fundamentals = HoldingsFundamental.all

    render json: @holdings_fundamentals
  end

  # GET /holdings_fundamentals/1
  def show
    render json: @holdings_fundamental
  end

  # POST /holdings_fundamentals
  def create
    @holdings_fundamental = HoldingsFundamental.new(holdings_fundamental_params)

    if @holdings_fundamental.save
      render json: @holdings_fundamental, status: :created, location: @holdings_fundamental
    else
      render json: @holdings_fundamental.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /holdings_fundamentals/1
  def update
    if @holdings_fundamental.update(holdings_fundamental_params)
      render json: @holdings_fundamental
    else
      render json: @holdings_fundamental.errors, status: :unprocessable_entity
    end
  end

  # DELETE /holdings_fundamentals/1
  def destroy
    @holdings_fundamental.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holdings_fundamental
      @holdings_fundamental = HoldingsFundamental.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def holdings_fundamental_params
      params.require(:holdings_fundamental).permit(:fundamental_link, :fundamental_link_href, :ticker, :return_fundamental, :market_cap, :yield, :p_e, :peg, :roe_ttm, :roi_ttm, :tot_debt_to_eq_ratio, :pr2cfl_per_shr_ttm, :strategy_name, :strategy_id)
    end
end
