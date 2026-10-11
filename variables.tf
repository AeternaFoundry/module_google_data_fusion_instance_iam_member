variable "data_fusion_instance_iam_members" {
  description = <<EOT
Map of data_fusion_instance_iam_members, attributes below
Required:
    - member
    - name
    - role
Optional:
    - project
    - region
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    member  = string
    name    = string
    role    = string
    project = optional(string)
    region  = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

