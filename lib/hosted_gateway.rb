require 'spree_core'

module HostedGateway
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end

      ExternalGateway.register
      CheckoutController.send(:include, HostedGateway::CheckoutControllerExt)
      Admin::PaymentsController.send(:include, HostedGateway::AdminPaymentsControllerExt)
    end

    config.to_prepare &method(:activate).to_proc
  end
end

