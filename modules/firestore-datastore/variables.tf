# ----------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# ----------------------------------------------------------------------------------------------------------------------

variable "name_suffix" {
  description = "An arbitrary suffix that will be added to the end of the resource name(s). For example: an environment name, a business-case name, a numeric id, etc."
  type        = string
  validation {
    condition     = length(var.name_suffix) <= 14
    error_message = "A max of 14 character(s) are allowed."
  }
}

# ----------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ----------------------------------------------------------------------------------------------------------------------

variable "user_groups" {
  description = "List of usergroup emails that maybe allowed to access Firestore console."
  type        = list(string)
  default     = []
}


variable "project_id"{
default = "my-project-957-311307"
}


variable "my-project-name"{
default = "My Project 957"
}

variable "region"{
    default = "us-central"
}
