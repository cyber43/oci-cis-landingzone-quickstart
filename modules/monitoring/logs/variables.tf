variable "compartment_id" {
  type        = string
  default     = ""
}

variable "log_group_display_name" {
  type        = string
  default     = ""
}

variable "log_group_description" {
  type        = string
  default     = ""
}

variable "target_resources" {
    type = map(object({
        log_display_name              = string
        log_type                      = string
        log_config_source_resource    = string
        log_config_source_category    = string
        log_config_source_compartment = string
        log_config_source_service     = string
        log_config_source_source_type = string
        log_is_enabled                = bool
        log_retention_duration        = number
        defined_tags                  = map(string)
        freeform_tags                 = map(string)
    }))
}
