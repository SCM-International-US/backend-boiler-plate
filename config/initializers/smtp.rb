ActionMailer::Base.smtp_settings = {
    address: 'smtp.sendgrid.net',
    port: 587,
    domain: 'yourdomain.com',
    user_name: ENV['SEND_GRID_USERNAME'],
    password: ENV['SEND_GRID_PASSWORD'],
    authentication: :login,
    enable_starttls_auto: true
}

ActionMailer::Base.smtp_settings = {
    # change once in prod
    domain: 'YOUR_DOMAIN.COM',
    address:        "smtp.sendgrid.net",
    port:            587,
    authentication: :plain,
    user_name:      'apikey',
    password:       ENV['SEND_GRID_API_KEY']
}