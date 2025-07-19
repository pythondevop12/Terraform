resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpv_id_val
  tags = {
    Name        = "${terraform.workspace}-IGW",
    Environment = "${terraform.workspace}"
    App         = "Jenkins"
  }
}


resource "aws_route_table" "Public_RT" {
  vpc_id = var.vpv_id_val
  route = {
    cidr_block = var.cidr_internet_block_val
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name        = "${terraform.workspace}-public-RT",
    Environment = "${terraform.workspace}"
    App         = "Jenkins"
  }

}


resource "aws_route_table_association" "Public_RT_Association" {
  count          = length(var.public_subnet_ids)
  subnet_id      = var.public_subnet_ids[count.index]
  route_table_id = aws_route_table.Public_RT
}

resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_GW" {
  allocation_id = aws_eip.nat
  subnet_id     = var.private_subnet_ids[0]
  depends_on    = [aws_internet_gateway.igw]
}

resource "aws_route_table" "private_RT" {
  vpc_id = var.vpv_id_val
  route = {
    cidr_block = var.cidr_internet_block_val
    gateway_id = aws_nat_gateway.nat_GW
  }
  tags = {
    Name        = "${terraform.workspace}-private-RT",
    Environment = "${terraform.workspace}"
    App         = "Jenkins"
  }
}


resource "aws_route_table_association" "Private_RT_Association" {
  count          = length(var.private_subnet_ids)
  subnet_id      = var.private_subnet_ids[count.index]
  route_table_id = aws_route_table.private_RT
}


resource "aws_vpc_endpoint" "s3endpoint" {
  vpc_id = var.vpv_id_val
  service_name = "com.amazonaws.${var.region}.s3"
  route_table_ids = [aws_route_table.private_RT.id]
}