OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "259980250779937", "90fc306c7b2aa3c4cf8198985e940af0"
end
