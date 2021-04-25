![checked(1)](https://user-images.githubusercontent.com/66175727/115995608-3675a580-a5dc-11eb-8458-b249ef825f50.png) **FT_SERVER**

*42cursus-Paris, 2020-2021*

*Developer: opassin*
*Mail: opassin@student.42.fr* 


**[COMMANDS LIST]**

*all these commands are specified in the Makefile*


- Build the docker image from the Dockerfile:
	>$ sudo make build

- Run the image in an isolated container
	>$ sudo make run

-sudo make log   : Print details of the last build.

-sudo make log_monitoring   : Print details log in real time.

-sudo make stop_last_ctn	    : Stop the last created container

-sudo make stop_all_ctn	    : Stop all currents containers

-sudo make rm_last_ctn	    : Remove the last container

-sudo make rm_all_ctn	    : Remove all currents containers




[COMMANDS UTILS]

sudo docker ps -a 	: list all containers

sudo docker images 	: list all images

sudo docker exec -it “replace by firsts id char.” bash : Enter into container 

				


[AUTOINDEX]

When you’re into the container, launch the script following script by running :

./enable_autoindex.sh or bash enable_autoindex.sh : autoindex on

./disable_autoindex.sh or bash disable_autoindex.sh : autoindex off













Coded by opassin, sponsored by coffee, for help contact: opassin@stduent.42.fr
