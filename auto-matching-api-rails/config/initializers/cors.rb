Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "localhost:3000", "*.netlify.com"
    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
    credentials: true
  end
end
