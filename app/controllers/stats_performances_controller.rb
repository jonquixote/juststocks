class StatsPerformancesController < ApiController
  before_action :set_stats_performance, only: [:show, :update, :destroy]

  # GET /stats_performances
  def index
    @stats_performances = StatsPerformance.all

    render json: @stats_performances
  end

  # GET /stats_performances/1
  def show
    render json: StatsPerformance.where(strategy_name: params[:id])
  end

  # POST /stats_performances
  def create
    @stats_performance = StatsPerformance.new(stats_performance_params)

    if @stats_performance.save
      render json: @stats_performance, status: :created, location: @stats_performance
    else
      render json: @stats_performance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stats_performances/1
  def update
    if @stats_performance.update(stats_performance_params)
      render json: @stats_performance
    else
      render json: @stats_performance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stats_performances/1
  def destroy
    @stats_performance.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stats_performance
      @stats_performance = StatsPerformance.friendly.find_by(strategy_name: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stats_performance_params
      params.require(:stats_performance).permit(:statistics_link, :statistics_link_href, :return_pct, :model, :snp_500_spy, :twenty_twenty_01, :twenty_twenty_02, :twenty_twenty_03, :twenty_twenty_04, :twenty_twenty_05, :twenty_twenty_06, :twenty_twenty_07, :twenty_twenty_08, :twenty_twenty_09, :twenty_twenty_10, :twenty_twenty_11, :twenty_twenty_12, :strategy_name, :strategy_id)
    end
end
