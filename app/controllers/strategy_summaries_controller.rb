class StrategySummariesController < ApiController
  before_action :set_strategy_summary, only: [:show, :update, :destroy]

  # GET /strategy_summaries
  def index
    @strategy_summaries = StrategySummary.all

    render json: @strategy_summaries
  end

  # GET /strategy_summaries/1
  def show
    render json: StrategySummary.where(strategy_name: params[:id])
  end

  # POST /strategy_summaries
  def create
    @strategy_summary = StrategySummary.new(strategy_summary_params)

    if @strategy_summary.save
      render json: @strategy_summary, status: :created, location: @strategy_summary
    else
      render json: @strategy_summary.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /strategy_summaries/1
  def update
    if @strategy_summary.update(strategy_summary_params)
      render json: @strategy_summary
    else
      render json: @strategy_summary.errors, status: :unprocessable_entity
    end
  end

  # DELETE /strategy_summaries/1
  def destroy
    @strategy_summary.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_strategy_summary
      @strategy_summary = StrategySummary.friendly.find_by(strategy_name: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def strategy_summary_params
      params.require(:strategy_summary).permit(:summary_link, :summary_link_href, :info_name, :info_value, :stats_name, :stats_value, :strategy_name, :strategy_id)
    end
end
