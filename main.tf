resource "google_data_fusion_instance_iam_member" "data_fusion_instance_iam_members" {
  for_each = var.data_fusion_instance_iam_members

  member  = each.value.member
  name    = each.value.name
  role    = each.value.role
  project = each.value.project
  region  = each.value.region

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

