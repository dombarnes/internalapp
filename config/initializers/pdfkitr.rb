PDFKit.configure do |config|
  config.wkhtmltopdf = '/Users/Shared/PDF'
  config.default_options = {
     :page_size => 'A4',
     :print_media_type => true
  }
  # config.root_url = "http://localhost" # Use only if your external hostname is unavailable on the server.
end