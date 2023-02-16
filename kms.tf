resource "yandex_kms_symmetric_key" "key-a" {
  name              = "kuber-symmetric-key"
  description       = "description for key"
  default_algorithm = "AES_128"
  rotation_period   = "8760h" // equal to 1 year
}