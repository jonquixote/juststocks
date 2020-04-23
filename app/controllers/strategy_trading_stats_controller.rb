class StrategyTradingStatsController < ApiController
  before_action :set_strategy_trading_stat, only: [:show, :update, :destroy]

  # GET /strategy_trading_stats
  def index
    @strategy_trading_stats = StrategyTradingStat.all

    render json: @strategy_trading_stats
  end

  # GET /strategy_trading_stats/1
  def show
    render json: StrategyTradingStat.where(strategy_name: params[:id])
  end

  # POST /strategy_trading_stats
  def create
    @strategy_trading_stat = StrategyTradingStat.new(strategy_trading_stat_params)

    if @strategy_trading_stat.save
      render json: @strategy_trading_stat, status: :created, location: @strategy_trading_stat
    else
      render json: @strategy_trading_stat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /strategy_trading_stats/1
  def update
    if @strategy_trading_stat.update(strategy_trading_stat_params)
      render json: @strategy_trading_stat
    else
      render json: @strategy_trading_stat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /strategy_trading_stats/1
  def destroy
    @strategy_trading_stat.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_strategy_trading_stat
      @strategy_trading_stat = StrategyTradingStat.friendly.find_by(strategy_name: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def strategy_trading_stat_params
      params.require(:strategy_trading_stat).permit(:trading_statistics_link, :trading_statistics_link_href, :trading_values, :trading_summary_names, :trading_names, :realized_all, :realized_winners, :realized_losers, :unrealized_all, :unrealized_winners, :unrealized_losers, :strategy_name, :strategy_id)
    end
end
