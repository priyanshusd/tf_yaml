resource "digitalocean_droplet" "Webserver" {
	image = "ubuntu-20-04-x64"
	name = "Webserver"
	region = "AMS3"
	size = "s-1vcpu-1gb"
	private_networking = true
	ssh_keys = [
		var.ssh_fingerprint
	]
	connection {
		host = self.ipv4_address
		user = "root"
		type = "ssh"
		private_key = file("C:/Users/sanke/.ssh/id_rsa")
		timeout = "2m"
	}
	provisioner "remote-exec" {
		inline = [
			# install nginx
			"sudo apt-get update",
			"sudo apt-get -y install nginx"
		]
	}

}