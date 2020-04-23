class StrategiesController < ApiController
  before_action :set_strategy, only: [:show, :update, :destroy]

  # GET /strategies
  def index
    @strategies = Strategy.all

    render json: @strategies
    # @strategy_id = Strategy.eager_load(:holdings_historicals)
    #              .find(params[:strategy_id])
  #   @holdings = @strategy.holdings.build
  #   @holdings_id = @holdings.eager_load(:holdings_currents)
  #                           .find(params[:holding_id])
  #   @holdings_currents = @holdings_id.holdings_currents.build

  end

  # GET /strategies/1
  def show
    render json: @strategy
    
  end

  # POST /strategies
  def create
    @strategy = Strategy.new(strategy_params)

    if @strategy.save
      render json: @strategy, status: :created, location: @strategy
    else
      render json: @strategy.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /strategies/1
  def update
    if @strategy.update(strategy_params)
      render json: @strategy
    else
      render json: @strategy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /strategies/1
  def destroy
    @strategy.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_strategy
      # @strategy = Strategy.eager_load(:holdings_historicals)
      #                        .find(params[:strategy_id])
      @strategy = Strategy.find(params[:strategy_id])
      
      # begin
      #   @strategy = Strategy.find(params[:strategy_id])
      # rescue ActiveRecord::RecordNotFound => e
      #   @strategy = nil
      # end
      # begin
      #   @holding = Holding.find(params[:holding_id])
      # rescue ActiveRecord::RecordNotFound => e
      #   @holding = nil
      # end
      # begin
      #   @holdings_current = HoldingsCurrent.find(params[:holdings_current_id])
      # rescue ActiveRecord::RecordNotFound => e
      #   @holdings_current = nil
      # end
    end

    # def set_holdings_current
    #   @holdings_current = HoldingsCurrent.find(params[:holdings_current_id])
    # end

    # def set_holding
    #   @holding = Holding.find(params[:holding_id])
    # end

    # Only allow a trusted parameter "white list" through.
    def strategy_params
      params.require(:strategy).permit(:datasheet, :web_scraper_order, :web_scraper_start_url, :ticker, :weight, :return, :return_dollars, :rank, :shares, :avg_share_cost, :current_price, :value, :days_held, :sector, :return_link, :return_link_href, :fundamental_link, :fundamental_link_href, :one_day, :last_close, :change, :weight_return, :one_week, :four_weeks, :eight_weeks, :thirteen_weeks, :return_fundamental, :market_cap, :yield, :p_e, :peg, :roe_ttm, :roi_ttm, :tot_debt_to_eq_ratio, :pr2cfl_per_shr_ttm, :historical_link, :historical_link_href, :cost, :open_date, :number_of_days, :pct_historical, :summary_link, :summary_link_href, :info_name, :info_value, :stats_name, :stats_value, :statistics_link, :statistics_link_href, :return_pct, :total, :model, :snp_500_spy, :twenty_twenty_01, :twenty_twenty_02, :twenty_twenty_03, :twenty_twenty_04, :twenty_twenty_05, :twenty_twenty_06, :twenty_twenty_07, :twenty_twenty_08, :twenty_twenty_09, :twenty_twenty_10, :twenty_twenty_11, :twenty_twenty_12, :charts_link, :charts_link_href, :trading_statistics_link, :trading_statistics_link_href, :trading_values, :trading_summary_names, :trading_names, :realized_all, :realized_winners, :realized_losers, :unrealized_all, :unrealized_winners, :unrealized_losers, :risk_measurements_stats_link, :risk_measurements_stats_link_href, :risk_name, :model_risk, :snp_500_spy_risk, :strategy_name)
    end
end
