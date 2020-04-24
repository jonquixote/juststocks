class WebhooksController < ApiController
  before_action :set_webhook, only: [:show, :update, :destroy]

  # GET /webhooks
  def index
    @webhooks = Webhook.all

    render json: @webhooks
  end

  # GET /webhooks/1
  def show
    render json: @webhook
  end

  # POST /webhooks
  def create
    @webhook = Webhook.new(webhook_params)

    if @webhook.save
      render json: @webhook, status: :created, location: @webhook
      Strategy.save_scrape
    else
      render json: @webhook.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /webhooks/1
  def update
    if @webhook.update(webhook_params)
      render json: @webhook
    else
      render json: @webhook.errors, status: :unprocessable_entity
    end
  end

  # DELETE /webhooks/1
  def destroy
    @webhook.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webhook
      @webhook = Webhook.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def webhook_params
      params.permit(:scrapingjob_id, :status, :sitemap_id, :sitemap_name)
    end

  def receive
    if request.headers['Content-Type'] == 'application/json'
      data = JSON.parse(request.body.read)
    else
      # application/x-www-form-urlencoded
      data = params.as_json
    end

    Webhook::Received.save(:scrapingjob_id, :status, :sitemap_id, :sitemap_name)

    render nothing: true
  end

end
