
# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

/*************************************
resource "oci_kms_vault" "this" {
    compartment_id = var.compartment_id
    display_name   = var.vault_name
    vault_type     = var.vault_type
    defined_tags   = var.defined_tags
    freeform_tags  = var.freeform_tags
}

************************************/
resource "oci_kms_key" "these" {
  for_each = var.keys
    compartment_id       = var.compartment_id
    display_name         = each.key
    #management_endpoint = oci_kms_vault.this.management_endpoint
    management_endpoint  = var.vault_mgmt_endPoint
    defined_tags         = each.value.defined_tags
    freeform_tags        = each.value.freeform_tags
    key_shape {
      algorithm = each.value.key_shape_algorithm
      length    = each.value.key_shape_length
    }
}