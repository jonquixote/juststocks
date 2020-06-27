class LiveStrategiesStatisticsController < ApiController
  before_action :set_live_strategies_statistic, only: [:show, :update, :destroy]

  # GET /live_strategies_statistics
  def index
    @live_strategies_statistics = LiveStrategiesStatistic.all

    render json: @live_strategies_statistics
  end

  # GET /live_strategies_statistics/1
  def show
    render json: LiveStrategiesStatistic.where(name: params[:id])
  end

  # POST /live_strategies_statistics
  def create
    @live_strategies_statistic = LiveStrategiesStatistic.new(live_strategies_statistic_params)

    if @live_strategies_statistic.save
      render json: @live_strategies_statistic, status: :created, location: @live_strategies_statistic
    else
      render json: @live_strategies_statistic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /live_strategies_statistics/1
  def update
    if @live_strategies_statistic.update(live_strategies_statistic_params)
      render json: @live_strategies_statistic
    else
      render json: @live_strategies_statistic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /live_strategies_statistics/1
  def destroy
    @live_strategies_statistic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_live_strategies_statistic
      @live_strategies_performance = LiveStrategiesStatistic.friendly.find_by(name: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def live_strategies_statistic_params
      params.require(:live_strategies_statistic).permit(:name, :annual, :dDown, :stdDev, :sharpeRatio, :sortinoRatio, :benchmarkCorrel, :alpha, :realizedWinners, :annualTurnover)
    end
end
