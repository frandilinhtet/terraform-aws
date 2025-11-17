variable "bucket-name" {
  description = "Bucket name"
  type        = string
}

variable "env" {
  description = "Environment of this bucket"
  type        = string
}

variable "acl" {
  description = "Value of block public acls"
  type        = bool
}

variable "policy" {
  description = "Value of block public policy"
  type        = bool
}

variable "ignore" {
  description = "Value of ignore public acls"
  type        = bool
}

variable "resrict" {
  description = "Value of restict public buckets"
  type        = bool
}