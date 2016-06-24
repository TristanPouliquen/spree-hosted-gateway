Rails.application.routes.draw do
  # Add your extension routes here
  match '/checkout/gateway_landing/:order' => 'checkout#process_gateway_return', :method => :get, :as => 'gateway_landing'
  match '/admin/checkout/gateway_landing/:order' => 'admin/payments#process_gateway_return', :method => :get, :as => 'admin_gateway_landing'
end

