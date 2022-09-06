IEX::Api.configure do |config|
    config.publishable_token = 'pk_ed649ff4ef704c2eb75311043162574e' # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
    config.secret_token = 'sk_a568c6b678fc43149610cf56080aefe9' # defaults to ENV['IEX_API_SECRET_TOKEN']
    config.endpoint = 'https://cloud.iexapis.com/v1' # use 'https://sandbox.iexapis.com/v1' for Sandbox
end