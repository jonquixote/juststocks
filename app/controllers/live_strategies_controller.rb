class LiveStrategiesController < ApiController
  before_action :set_live_strategy, only: [:show, :update, :destroy]

  # GET /live_strategies
  def index
    @live_strategies = LiveStrategy.all

    render json: @live_strategies
  end

  # GET /live_strategies/1
  def show
    render json: LiveStrategy.where(name: params[:id])
  end

  # POST /live_strategies
  def create
    @live_strategy = LiveStrategy.new(live_strategy_params)

    if @live_strategy.save
      render json: @live_strategy, status: :created, location: @live_strategy
    else
      render json: @live_strategy.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /live_strategies/1
  def update
    if @live_strategy.update(live_strategy_params)
      render json: @live_strategy
    else
      render json: @live_strategy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /live_strategies/1
  def destroy
    @live_strategy.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_live_strategy
      @live_strategy = LiveStrategy.friendly.find_by(name: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def live_strategy_params
      params.require(:live_strategy).permit(:name, :thype, :rank_system, :inception, :upDate, :rebal, :holdings, :annual, :sharpe_ratio, :d_down)
    end
end
