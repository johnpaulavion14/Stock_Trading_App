IEX::Api.configure do |config|
    config.publishable_token = 'pk_6522fa45122342e88b8b3252a19ea8a7' # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
    config.secret_token = 'sk_cf2b194d73374ffc924b1412bee05cd1' # defaults to ENV['IEX_API_SECRET_TOKEN']
    config.endpoint = 'https://cloud.iexapis.com/v1' # use 'https://sandbox.iexapis.com/v1' for Sandbox
end