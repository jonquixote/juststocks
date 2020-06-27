class LiveStrategiesPerformancesController < ApiController
  before_action :set_live_strategies_performance, only: [:show, :update, :destroy]

  # GET /live_strategies_performances
  def index
    @live_strategies_performances = LiveStrategiesPerformance.all

    render json: @live_strategies_performances
  end

  # GET /live_strategies_performances/1
  def show
    render json: LiveStrategiesPerformance.where(name: params[:id])
  end

  # POST /live_strategies_performances
  def create
    @live_strategies_performance = LiveStrategiesPerformance.new(live_strategies_performance_params)

    if @live_strategies_performance.save
      render json: @live_strategies_performance, status: :created, location: @live_strategies_performance
    else
      render json: @live_strategies_performance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /live_strategies_performances/1
  def update
    if @live_strategies_performance.update(live_strategies_performance_params)
      render json: @live_strategies_performance
    else
      render json: @live_strategies_performance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /live_strategies_performances/1
  def destroy
    @live_strategies_performance.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_live_strategies_performance
      @live_strategies_performance = LiveStrategiesPerformance.friendly.find_by(name: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def live_strategies_performance_params
      params.require(:live_strategies_performance).permit(:name, :annual, :annualBench, :ytd, :benchYtd, :oneYear, :benchOneYear, :totRet, :benchRet, :oneDay, :oneWeek, :fourWeeks, :thirteenWeeks, :twentySixWeeks)
    end
end
