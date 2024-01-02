# This output represents the URL of the application.
output "app_url" {
  value = "http://${module.testapp_fastapi_stack.alb_dns_name}"
}
