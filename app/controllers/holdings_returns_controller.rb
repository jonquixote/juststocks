class HoldingsReturnsController < ApiController
  before_action :set_holdings_return, only: [:show, :update, :destroy]

  # GET /holdings_returns
  def index
    @holdings_returns = HoldingsReturn.all

    render json: @holdings_returns
  end

  # GET /holdings_returns/1
  def show
    render json: @holdings_return
  end

  # POST /holdings_returns
  def create
    @holdings_return = HoldingsReturn.new(holdings_return_params)

    if @holdings_return.save
      render json: @holdings_return, status: :created, location: @holdings_return
    else
      render json: @holdings_return.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /holdings_returns/1
  def update
    if @holdings_return.update(holdings_return_params)
      render json: @holdings_return
    else
      render json: @holdings_return.errors, status: :unprocessable_entity
    end
  end

  # DELETE /holdings_returns/1
  def destroy
    @holdings_return.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holdings_return
      @holdings_return = HoldingsReturn.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def holdings_return_params
      params.require(:holdings_return).permit(:return_link, :return_link_href, :ticker, :one_day, :last_close, :change, :weight_return, :one_week, :four_weeks, :eight_weeks, :thirteen_weeks)
    end
end
