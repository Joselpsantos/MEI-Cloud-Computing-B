consul {
  address = "localhost:8500"
retry {
    enabled  = true
    attempts = 12
    backoff  = "250ms"
  }
}
template {
  source      = "/etc/nginx/nginx.ctmpl"
  destination = "/etc/nginx/nginx.conf"
  perms       = 0600
  command     = "service nginx reload"
}