provider "aws" {
    
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
  region     = var.AWS_DEFAULT_REGION
}

resource "aws_vpc" "main1" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        Name = "Main VPC 1"
    }
}

resource "aws_subnet" "subnet1" {
    vpc_id = "${aws_vpc.main1.id}"
    cidr_block = "10.0.10.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-east-2a"
    tags = {
        Name = "Subnet 1 - us-east-2a"
    }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = "${aws_vpc.main1.id}"
    tags = {
        Name = "Gateway Main"
    }
}

resource "aws_route_table" "r" {
    vpc_id = "${aws_vpc.main1.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }
}

resource "aws_route_table_association" "table_subnet1" {
    subnet_id = aws_subnet.subnet1.id
    route_table_id = aws_route_table.r.id

}