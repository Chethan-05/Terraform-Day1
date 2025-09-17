


resource "aws_vpc" "main" {

  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "terraformvpc"
  }

}

resource "aws_subnet" "public" {
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  vpc_id            = aws_vpc.main.id
  tags = {
    Name = "Public"

  }

}

resource "aws_subnet" "private" {

  cidr_block        = "10.0.3.0/24"
  vpc_id            = aws_vpc.main.id
  availability_zone = "us-east-1b"
  tags = {
    Name = "private"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "Internet"
  }


}

resource "aws_route_table" "First" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "10.0.0.0/24"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Public RT"
  }

}

resource "aws_route_table" "second" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "10.0.1.0/24"
  }
  tags = {
    Name = "Private RT"
  }
  
}

resource "aws_route_table_association" "First-association" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.First.id
  
}

resource "aws_route_table_association" "Second-association" {
  subnet_id = aws_subnet.private.id
  route_table_id = aws_route_table.second.id
  
}

resource "aws_instance" "webserver" {

  ami               = "ami-0b09ffb6d8b58ca91"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Web-Server"
  }
}

resource "aws_instance" "Appserver" {

  ami               = "ami-0b09ffb6d8b58ca91"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1b"

  tags = {
    Name = "App-Server"
  }
}

