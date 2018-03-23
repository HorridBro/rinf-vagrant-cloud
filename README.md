# rinf-vagrant-cloud

> Private Vagrant box hosting


### Install
Vagrancy has all its dependencies packaged with it. It requires no runtime at all.
```shell
sudo docker pull palecsandru/rinf-vagrant-cloud
sudo docker run -dit -p 4000:8099 --restart=always --name vagrantcloud01 -v /opt/vagrantboxes:/data palecsandru/rinf-vagrant-cloud
sudo docker ps./vagrancy
```

### Publishing images
You can easily upload a box you have built locally using `curl`.
```
curl http://localhost:8099/myusername/ubuntu/1.0.0/virtualbox --upload-file ubuntu-precise.box
```

### Using in Vagrant
Using Vagrancy requires a different Vagrant server URL. This can be set as an environment variable *or* as part of the `Vagrantfile`. Here is an example `Vagrantfile` with the server URL set.
```ruby
ENV['VAGRANT_SERVER_URL'] = 'http://localhost:8099'
Vagrant.configure(2) do |config|
  config.vm.box = "myusername/ubuntu"
end
```
### API
Operation| Command 
---------|----------
**Deleting a box** | `curl -XDELETE http://localhost:8099/myusername/ubuntu/1.0.0/virtualbox`
**Manually uploading a box** | `curl http://localhost:8099/myusername/ubuntu/1.0.0/virtualbox --upload-file ubuntu-precise.box`
**Listing box versions** | `curl http://localhost:8099/myusername/ubuntu`
**Deleting all box versions** | *Each box must be specifically deleted*

### Security
Vagrancy is intending to be used in a trusted network and hence doesn't deal with authentication. As can be see in
the above examples, reading, writing and modifying boxes is allowed without authentication.
