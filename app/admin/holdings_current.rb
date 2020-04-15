ActiveAdmin.register HoldingsCurrent do
  permit_params :ticker, :weight, :return, :return_dollars, :rank, :shares, :avg_share_cost, :current_price, :value, :days_held, :strategy_name, :sector
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :ticker, :company_name, :description, :last_price
  #
  # or
  #
  # permit_params do
  #   permitted = [:ticker, :company_name, :description, :last_price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
