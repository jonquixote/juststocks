class RiskMeasurementsController < ApiController
  before_action :set_risk_measurement, only: [:show, :update, :destroy]

  # GET /risk_measurements
  def index
    @risk_measurements = RiskMeasurement.all

    render json: @risk_measurements
  end

  # GET /risk_measurements/1
  def show
    render json: RiskMeasurement.where(strategy_name: params[:id])
  end

  # POST /risk_measurements
  def create
    @risk_measurement = RiskMeasurement.new(risk_measurement_params)

    if @risk_measurement.save
      render json: @risk_measurement, status: :created, location: @risk_measurement
    else
      render json: @risk_measurement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /risk_measurements/1
  def update
    if @risk_measurement.update(risk_measurement_params)
      render json: @risk_measurement
    else
      render json: @risk_measurement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /risk_measurements/1
  def destroy
    @risk_measurement.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_risk_measurement
      @risk_measurement = RiskMeasurement.friendly.find_by(strategy_name: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def risk_measurement_params
      params.require(:risk_measurement).permit(:risk_measurements_stats_link, :risk_measurements_stats_link_href, :risk_name, :model_risk, :snp_500_spy_risk, :strategy_name, :strategy_id)
    end
end
