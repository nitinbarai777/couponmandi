OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "491255187558463", "dd7c7b96b6c78e01101ab22b6f0f1fcd"
end
