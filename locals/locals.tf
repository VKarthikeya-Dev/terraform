locals{
    final_name = "${var.project}-${var.environment}-${var.component}"
}
output "locals"{
    value = local.final_name
}
