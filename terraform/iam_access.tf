resource "aws_iam_group" "administradores" {
  name = "Administradores"
}

resource "aws_iam_policy_attachment" "administradores" {
  name = "admins-attach"
  policy_arn = "arn:aws:iam::aws:policy/job-function/SystemAdministrator"
  groups = ["${aws_iam_group.administradores.name}"]
}

resource "aws_iam_user" "admin" {
  name = "admin"
#  groups = ["${aws_iam_group.administradores.name}"]
}

resource "aws_iam_user" "admin2" {
  name = "admin2"
#  groups = ["${aws_iam_group.administradores.name}"]
} 

resource "aws_iam_group_membership" "admins-users" {
  name = "admins-users"
  group = "${aws_iam_group.administradores.name}"
  users = [
      "${aws_iam_user.admin.name}",
      "${aws_iam_user.admin2.name}"
      ]
}

resource "aws_iam_access_key" "admin-access" {
  user = "${aws_iam_user.admin.name}"
}

resource "aws_iam_access_key" "admin2-access" {
  user = "${aws_iam_user.admin2.name}"
}

output "admin_access_key" {
  value = "${aws_iam_access_key.admin-access.id}"
  
}
output "admin_secret_key" {
  value = "${aws_iam_access_key.admin-access.secret}"
  sensitive = true
}
output "admin2_access_key" {
  value = "${aws_iam_access_key.admin2-access.id}"
}
output "admin2_secret_key" {
  value = "${aws_iam_access_key.admin2-access.encrypted_secret}"
}