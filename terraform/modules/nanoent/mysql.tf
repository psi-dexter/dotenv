provider "mysql" {
  endpoint = "localhost:3306"
  username = "root"
  password = ""
}
resource "mysql_role" "developer" {
  name = "developer"
}

resource "mysql_grant" "developer_db" {
  grant      = true
  role       = mysql_role.developer.name
  database   = mysql_database.nanoent.name
  privileges = ["SELECT", "UPDATE"]
}
# Create a Database
resource "mysql_database" "nanoent" {
  name = "nanoent_infowaste"
}
resource "mysql_user" "infowaste" {
  user               = "infowaste"
  plaintext_password = "nfowaste"
}
resource "mysql_grant" "developer" {
  grant    = true
  user     = mysql_user.infowaste.user
  database = mysql_database.nanoent.name
  roles    = ["${mysql_role.developer.name}"]
}
