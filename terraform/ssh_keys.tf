resource "aws_key_pair" "deployer" {
  key_name   = "ndf-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDVTxjqXeBGgP2FcjuAX3DLp/xiBuUjEexrugTPFkbTCuB0dcmSzjF5TL5K/E8fzqDp7j4pG1FTymV0jFJOLaHLhbml38I0QHT2bgNgWTmwQfNs9/MNhZsODc5Jo2q76L1XSMhFyka06tcO3+LYvWpddZsGHni9DVYs30l+PmG74Jbf5tXXThWkNTN0c0OPpts5BPI6NuufEISeWn6xNlXsVXuGdoiABurc1B65f/5HNtHwrplBVpB9k0cvEWq+oDkCJYNdIu5hMQr0lqNxl2xItx0nU4FMuMlXZCABniAbUoO2g73FelMqYrvccN99aqEeBGF70pPllqnHNBpJztkqTBQ4/GHkfIOIA7FKAcQZAwEJ6QD0MPpNQwJk4YEvci5j3jQvFkfZLcz0GeTkw8vsKnoGV7pn63Scc3xoJJYlR3U7bKG8JAy5VarB6MEdfm67CfAKxYMzCQJHD/L+Vya3dneLdDgdt1kWsRAKUoK+lUSfWTmZFBP5VXYf8npyIaE= ndf@DESKTOP-GA9KPA4"
  tags = {
    Name = "ndf_key"
  }
}

resource "aws_key_pair" "key-class1" {
    key_name   = "class1_key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC3eUQx4CVjsEhiwqWPMLkGYwdcxDNB49wQHtOxEGVoF4MrZGJ25NQ77TKuiSg/b9GfggsA195Sq1184FkorKgnO+iSmt0iJHZLU03wKAL8qeIwMFyRdeJIgnbzexGTvG4MY9bWF2NlXe29olKeFkqo04pg2bd/L0srQR2r9XBvF1eIqjIVOB5r1Dt+FCwjXdDPH1McBPwk5gvydY78UmWIvsc9B6u4P998Aq8Vx4oEMeEo2Nb+dW8TnNirQvSf/YR/MHW4jYG3NSVPnOZLt9kNNtvoALfTWUuGzuIFalnDPqXZ8WjWUmffmRbLCDsEsmoFjC7OoOhKAxWKA27IrT0CQh0uJN+JfqbPe8W0FB3m8PfZIifsszyiPPbAkRH9z/O/73v8EA+Y+WfTL0qWdettuTmyj7n0UL0dD4E8KPadeWb+W8p3O4hJJDMlAFhhVr3/u2ONypVIiEJ7SQhT25O3ZJD/kCpRVPUSuN8AtdWTllL5s6WwiKTcjUBjYbGv0ocDnTpIqoaAgzQxrM1RlD1LVjBm2QQBk2XrwvR2PMCcWMZ0lRAO+L/8/A9VyJ9CoxUeNWImPD19IH+h+5BR8kQw3ta8E7PazGToAd6H+8QiU7helkaNj4vO/bA+8VxYwJRmYRvdzmehfLJEQRx25kEnjOdHmOVCu5BFINgfsjH/UQ=="
    tags = {
        Name = "key-class1"
    }
}

#Se genera una llave SSH para el usuario usando el archivo pub 
resource "aws_key_pair" "key-class2" {
    key_name   = "class2_key"
    public_key = "${file("ssh_keys/pim2021_key.pem.pub")}"
    tags = {
        Name = "key-class2"
    }
}

resource "aws_key_pair" "key-class3" {
    key_name   = "class3_key"
    public_key = "${file("ssh_keys/pim2021_key.pem.pub")}"
    tags = {
        Name = "key-class3"
    }
}