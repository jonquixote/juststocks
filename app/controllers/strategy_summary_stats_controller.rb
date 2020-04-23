class StrategySummaryStatsController < ApiController
  before_action :set_strategy_summary_stat, only: [:show, :update, :destroy]

  # GET /strategy_summary_stats
  def index
    @strategy_summary_stats = StrategySummaryStat.all

    render json: @strategy_summary_stats
  end

  # GET /strategy_summary_stats/1
  def show
    render json: StrategySummaryStat.where(strategy_name: params[:id])
  end

  # POST /strategy_summary_stats
  def create
    @strategy_summary_stat = StrategySummaryStat.new(strategy_summary_stat_params)

    if @strategy_summary_stat.save
      render json: @strategy_summary_stat, status: :created, location: @strategy_summary_stat
    else
      render json: @strategy_summary_stat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /strategy_summary_stats/1
  def update
    if @strategy_summary_stat.update(strategy_summary_stat_params)
      render json: @strategy_summary_stat
    else
      render json: @strategy_summary_stat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /strategy_summary_stats/1
  def destroy
    @strategy_summary_stat.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_strategy_summary_stat
      @strategy_summary_stat = StrategySummaryStat.friendly.find_by(strategy_name: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def strategy_summary_stat_params
      params.require(:strategy_summary_stat).permit(:summary_link, :summary_link_href, :stats_name, :stats_value, :strategy_name, :strategy_id)
    end
end
