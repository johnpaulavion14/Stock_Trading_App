IEX::Api.configure do |config|
    config.publishable_token = 'pk_64fa39262f6f4570824e2d99b4b90248' # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
    config.secret_token = 'sk_8d2a370755764be3b9404f3b70f3b40c' # defaults to ENV['IEX_API_SECRET_TOKEN']
    config.endpoint = 'https://cloud.iexapis.com/v1' # use 'https://sandbox.iexapis.com/v1' for Sandbox
end