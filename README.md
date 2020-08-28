
## Automating Pipeline With Containerisation
## Insalling Jenkins on a EC2 instance. TETST 123

##### First we must spin up a EC2 intances on AWS (T2-Micro). This will be our main jenkins instance. Set the security group inbound rules as follows (We will make adjustments to this later.

![](images/1.png)

##### Now We can spin up a 2nd EC2 instance. This will be the secondary Jenkins instance. Se the inbound rules as follows. (Agin we will make changes to this later)

![](images/2.png)


##### Now we can SSH into the first main Instance (1st). Use the public IP address. This is where we will install Jenkins.

![](images/3.png)

##### In order now paste these commands into the VM.
```
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add –
```
```
echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
```
```
sudo apt-get update
```
```
sudo apt-get install Jenkins
```

##### If an error occurs when performing the last command you can try and paste the following command and then try reinstalling Jenkins

```
sudo apt install openjdk-8-jre
```
```
sudo apt-get update
```
```
sudo systemctl start Jenkins
```
##### Now lets see if Jenkins is running

```
sudo systemctl status Jenkins
```
##### It should say that Jenkins is active like below:

![](images/4.png)

##### Now when you visit the main Instances public IP adress you should be able to access the following webpage. Note I was not able to access the page at first. I had to edit the inbound rules of the main Instance to allow for all tracffic on port 8080.

![](images/5.png)

##### Now we need to get the Admin password. Go bac onto the git bash terminal and paste the following command:
```
cat /var/lib/jenkins/secrets/initialAdminPassword
```
##### Once pasted inside the terminal the password should appear as seen below:

![](images/6.png)

##### Now go back to the Jenkins web page and enter in the password

![](images/7.png)

##### From here now select Install suggested plugins

![](images/8.png)

##### Now wait for it to install the plugins

![](images/9.png)

##### You should be prompted to create a user like below. Enter the details that you would like to use and click save and continue

![](images/10.png)

