
resource "aws_vpc" "my-vpc" {
    cidr_block           = var.vpc_cidr
    enable_dns_support   = "true"       #gives you an internal domain name
    enable_dns_hostnames = "true"       #gives you an internal host name
    enable_classiclink   = "false"
    instance_tenancy     = "default"

    tags = {
        Name = var.vpc_name
    }
}

resource "aws_subnet" "my-public-subnet" {
    count=length(var.public_subnet_cidr)
    vpc_id                  = aws_vpc.my-vpc.id
    cidr_block              = var.public_subnet_cidr[count.index]
    map_public_ip_on_launch = "true"        #it makes this a public subnet
    availability_zone       = var.availability_zone
    tags = {
        Name = var.subnet_name
    }
}

resource "aws_internet_gateway" "my-igw" {
    vpc_id = aws_vpc.my-vpc.id
    tags = {
        Name = var.igw_name
    }
}

resource "aws_route_table" "public-crt" {
    vpc_id = aws_vpc.my-vpc.id

    route {
        cidr_block   = "0.0.0.0/0"                           #associated subnet can reach everywhere
        gateway_id   = aws_internet_gateway.my-igw.id   #CRT uses this IGW to reach internet
    }

    tags = {
        Name = "my-vpc-public"
    }
}
